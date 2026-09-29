-- =========================================================
-- AJOUT — permet aux admins de réinitialiser les compteurs
-- (la suppression de fiches était déjà autorisée pour les admins)
-- À COLLER une seule fois dans : Supabase → SQL Editor → RUN
-- =========================================================

drop policy if exists "les admins modifient les compteurs" on counters;
create policy "les admins modifient les compteurs" on counters
  for update using (is_admin());
