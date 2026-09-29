// =========================================================
// REPLAY CORE — connexion à la base de données Supabase
// Ces deux valeurs ne sont PAS secrètes : elles sont faites
// pour être visibles dans le code d'un site public.
// =========================================================

const SUPABASE_URL = "https://jdugbmfdwnxvnfwdjpuk.supabase.co";
const SUPABASE_ANON_KEY = "sb_publishable_61ZiXqbjBRiXzyrQfRkdtg_XX0hahvk";

const sb = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

// Domaine fictif utilisé en interne pour l'authentification
// (l'utilisateur ne voit et ne tape jamais d'email)
const EMAIL_DOMAIN = "@replay-core.internal";

function identifiantToEmail(identifiant) {
  return identifiant.trim().toLowerCase().replace(/\s+/g, "-") + EMAIL_DOMAIN;
}
