-- =========================================================
-- REPLAY CORE — schéma de base de données Supabase
-- À COLLER dans : Supabase → SQL Editor → New query → RUN
-- =========================================================

-- 1. Extension nécessaire pour générer des identifiants uniques
create extension if not exists "pgcrypto";

-- 2. Table des profils (un profil = un membre du site)
create table if not exists profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  identifiant text unique not null,
  access_level text not null default 'MEMBRE',
  status text not null default 'ACTIF' check (status in ('ACTIF','SUSPENDU')),
  created_at timestamptz not null default now()
);

-- 3. Table des codes d'accréditation
create table if not exists accreditation_codes (
  code text primary key,
  level text not null default 'MEMBRE',
  max_uses int not null default 1,
  uses int not null default 0,
  expires_at timestamptz,
  note text,
  created_by uuid references profiles(id),
  created_at timestamptz not null default now()
);

-- 4. Table des compteurs (un par type de fiche)
create table if not exists counters (
  type text primary key,
  count int not null default 0
);
insert into counters (type, count) values
  ('person',0),('memory',0),('event',0),('anomaly',0),('fragment',0),('data',0)
on conflict (type) do nothing;

-- 5. Table des fiches archivées
create table if not exists fiches (
  id uuid primary key default gen_random_uuid(),
  type text not null check (type in ('person','memory','event','anomaly','fragment','data')),
  number int not null,
  archive_id text not null unique,
  content text not null,
  links text[] default '{}',
  author_id uuid references profiles(id),
  created_at timestamptz not null default now()
);

-- =========================================================
-- SÉCURITÉ (Row Level Security) — qui a le droit de faire quoi
-- =========================================================

alter table profiles enable row level security;
alter table accreditation_codes enable row level security;
alter table counters enable row level security;
alter table fiches enable row level security;

-- Fonctions "de confiance" pour vérifier le statut d'un membre SANS
-- redéclencher les règles de sécurité sur la table profiles elle-même
-- (une règle qui s'interroge elle-même provoque une boucle infinie).
create or replace function is_admin()
returns boolean
language sql
security definer
set search_path = public
as $$
  select exists (select 1 from profiles where id = auth.uid() and access_level = 'ADMIN');
$$;

create or replace function is_active_member()
returns boolean
language sql
security definer
set search_path = public
as $$
  select exists (select 1 from profiles where id = auth.uid() and status = 'ACTIF');
$$;

grant execute on function is_admin() to authenticated;
grant execute on function is_active_member() to authenticated;

-- Profils : chacun voit son propre profil, les admins voient tout le monde
create policy "profil visible par son propriétaire" on profiles
  for select using (auth.uid() = id);
create policy "les admins voient tous les profils" on profiles
  for select using (is_admin());
create policy "les admins modifient tous les profils" on profiles
  for update using (is_admin());

-- Codes d'accréditation : réservés aux admins (la création de compte passe par une fonction séparée, voir plus bas)
create policy "les admins gèrent les codes" on accreditation_codes
  for all using (is_admin());

-- Compteurs : lecture publique pour tout membre connecté
create policy "compteurs visibles par les membres connectés" on counters
  for select using (auth.uid() is not null);

-- Fiches : tout membre actif peut lire et créer, personne ne peut modifier/supprimer sauf un admin
create policy "fiches visibles par les membres actifs" on fiches
  for select using (is_active_member());
create policy "les membres actifs peuvent archiver une fiche" on fiches
  for insert with check (is_active_member());
create policy "les admins peuvent supprimer une fiche" on fiches
  for delete using (is_admin());

-- =========================================================
-- FONCTIONS (le "cerveau" côté serveur, sécurisé)
-- =========================================================

-- Inscription : vérifie le code d'accréditation puis crée le profil
create or replace function register_with_code(p_code text, p_identifiant text)
returns json
language plpgsql
security definer
set search_path = public
as $$
declare
  v_code accreditation_codes%rowtype;
begin
  select * into v_code from accreditation_codes where code = p_code for update;

  if v_code.code is null then
    return json_build_object('ok', false, 'error', 'CODE_INTROUVABLE');
  end if;
  if v_code.expires_at is not null and v_code.expires_at < now() then
    return json_build_object('ok', false, 'error', 'CODE_EXPIRE');
  end if;
  if v_code.uses >= v_code.max_uses then
    return json_build_object('ok', false, 'error', 'CODE_EPUISE');
  end if;
  if exists (select 1 from profiles where identifiant = p_identifiant) then
    return json_build_object('ok', false, 'error', 'IDENTIFIANT_PRIS');
  end if;

  insert into profiles (id, identifiant, access_level, status)
  values (auth.uid(), p_identifiant, v_code.level, 'ACTIF');

  update accreditation_codes set uses = uses + 1 where code = p_code;

  return json_build_object('ok', true, 'level', v_code.level);
end;
$$;

-- Archivage d'une fiche : incrémente le compteur et crée l'ID (ex: PERSON_001)
create or replace function archive_fiche(p_type text, p_content text, p_links text[])
returns json
language plpgsql
security definer
set search_path = public
as $$
declare
  v_number int;
  v_archive_id text;
begin
  if not exists (select 1 from profiles where id = auth.uid() and status = 'ACTIF') then
    return json_build_object('ok', false, 'error', 'NON_AUTORISE');
  end if;

  update counters set count = count + 1 where type = p_type returning count into v_number;
  v_archive_id := upper(p_type) || '_' || lpad(v_number::text, 3, '0');

  insert into fiches (type, number, archive_id, content, links, author_id)
  values (p_type, v_number, v_archive_id, p_content, coalesce(p_links, '{}'), auth.uid());

  return json_build_object('ok', true, 'archive_id', v_archive_id);
end;
$$;

grant execute on function register_with_code(text, text) to authenticated;
grant execute on function archive_fiche(text, text, text[]) to authenticated;

-- =========================================================
-- COMPTE ADMIN DE DÉPART
-- =========================================================
-- Une fois ce script exécuté, crée ton compte normalement sur le site
-- avec un code temporaire (étape suivante), PUIS reviens ici et lance
-- cette ligne en remplaçant TON_IDENTIFIANT par celui que tu as choisi :
--
-- update profiles set access_level = 'ADMIN' where identifiant = 'TON_IDENTIFIANT';
