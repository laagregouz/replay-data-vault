-- =========================================================
-- CORRECTIF — boucle infinie dans les règles de sécurité
-- À COLLER une seule fois dans : Supabase → SQL Editor → RUN
-- =========================================================

-- Fonctions "de confiance" qui vérifient le statut d'un membre
-- SANS redéclencher les règles de sécurité sur la table profiles
-- (c'est ça qui causait la boucle infinie)

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

-- Remplace les anciennes règles par des versions qui utilisent ces fonctions

drop policy if exists "les admins voient tous les profils" on profiles;
create policy "les admins voient tous les profils" on profiles
  for select using (is_admin());

drop policy if exists "les admins modifient tous les profils" on profiles;
create policy "les admins modifient tous les profils" on profiles
  for update using (is_admin());

drop policy if exists "les admins gèrent les codes" on accreditation_codes;
create policy "les admins gèrent les codes" on accreditation_codes
  for all using (is_admin());

drop policy if exists "fiches visibles par les membres actifs" on fiches;
create policy "fiches visibles par les membres actifs" on fiches
  for select using (is_active_member());

drop policy if exists "les membres actifs peuvent archiver une fiche" on fiches;
create policy "les membres actifs peuvent archiver une fiche" on fiches
  for insert with check (is_active_member());

drop policy if exists "les admins peuvent supprimer une fiche" on fiches;
create policy "les admins peuvent supprimer une fiche" on fiches
  for delete using (is_admin());
