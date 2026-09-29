-- =========================================================
-- FONCTIONNALITÉS RP — incident, fiches corrompues, journal système
-- À COLLER une seule fois dans : Supabase → SQL Editor → RUN
-- =========================================================

-- 1. Marqueur "fiche corrompue" (pour les indices RP dans les Archives)
alter table fiches add column if not exists corrupted boolean not null default false;

-- 2. Réglages généraux du site (bannière d'incident, etc.)
create table if not exists settings (
  key text primary key,
  value text not null default ''
);
insert into settings (key, value) values
  ('incident_enabled', 'false'),
  ('incident_text', '')
on conflict (key) do nothing;

alter table settings enable row level security;
drop policy if exists "réglages visibles par les membres actifs" on settings;
create policy "réglages visibles par les membres actifs" on settings
  for select using (is_active_member());
drop policy if exists "les admins modifient les réglages" on settings;
create policy "les admins modifient les réglages" on settings
  for update using (is_admin());

-- 3. Journal système (lignes d'ambiance affichées sur le Core Monitor)
create table if not exists system_log (
  id uuid primary key default gen_random_uuid(),
  entry_date date not null default current_date,
  message text not null,
  created_at timestamptz not null default now()
);

alter table system_log enable row level security;
drop policy if exists "journal visible par les membres actifs" on system_log;
create policy "journal visible par les membres actifs" on system_log
  for select using (is_active_member());
drop policy if exists "les admins gèrent le journal" on system_log;
create policy "les admins gèrent le journal" on system_log
  for all using (is_admin());

-- 4. Mise à jour de la fonction d'archivage : n'accepte le marqueur
--    "corrompu" que si c'est bien un admin qui l'envoie (sécurité).
create or replace function archive_fiche(p_type text, p_content text, p_links text[], p_corrupted boolean default false)
returns json
language plpgsql
security definer
set search_path = public
as $$
declare
  v_number int;
  v_archive_id text;
  v_is_admin boolean;
begin
  if not exists (select 1 from profiles where id = auth.uid() and status = 'ACTIF') then
    return json_build_object('ok', false, 'error', 'NON_AUTORISE');
  end if;

  select is_admin() into v_is_admin;

  update counters set count = count + 1 where type = p_type returning count into v_number;
  v_archive_id := upper(p_type) || '_' || lpad(v_number::text, 3, '0');

  insert into fiches (type, number, archive_id, content, links, author_id, corrupted)
  values (p_type, v_number, v_archive_id, p_content, coalesce(p_links, '{}'), auth.uid(), (p_corrupted and v_is_admin));

  return json_build_object('ok', true, 'archive_id', v_archive_id);
end;
$$;

grant execute on function archive_fiche(text, text, text[], boolean) to authenticated;
