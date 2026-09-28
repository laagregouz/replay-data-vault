# REPLAY CORE — site web

Système d'archivage RP en ligne (version web de REPLAY CORE), avec connexion par identifiant/mot de passe, codes d'accréditation, et 6 types de fiches (PERSON, MEMORY, EVENT, ANOMALY, FRAGMENT, DATA).

## Mise en route (à faire une seule fois)

### 1. Base de données (Supabase)

1. Ouvre ton projet sur [supabase.com](https://supabase.com).
2. Va dans **SQL Editor** → **New query**.
3. Copie-colle tout le contenu du fichier `sql/schema.sql` de ce dépôt, puis clique sur **RUN**.
4. Va dans **Authentication → Providers → Email**, et **désactive** l'option **"Confirm email"**. (Nécessaire car le site n'utilise pas de vraies adresses email.)

### 2. Créer ton premier code d'accréditation (pour devenir admin)

Toujours dans **SQL Editor**, lance cette commande (remplace `MONCODE2026` par ce que tu veux) :

```sql
insert into accreditation_codes (code, level, max_uses, note)
values ('MONCODE2026', 'ADMIN', 1, 'code de démarrage');
```

### 3. Publier le site (GitHub Pages)

1. Sur GitHub, va dans **Settings → Pages** de ce dépôt.
2. Dans **Source**, choisis **Deploy from a branch**.
3. Choisis la branche **main** et le dossier **/ (root)**.
4. Clique **Save**. Le site sera disponible sous 1-2 minutes à une adresse du type :
   `https://laagregouz.github.io/replay-data-vault/`

### 4. Créer ton compte admin

1. Va sur le site, onglet **INSCRIPTION**.
2. Code d'accréditation : `MONCODE2026` (celui créé à l'étape 2).
3. Choisis ton identifiant et ton mot de passe.
4. Une fois inscrit, tu es automatiquement **ADMIN** (car le code avait le niveau ADMIN).

### 5. Créer des codes pour tes joueurs

Va dans l'onglet **ADMIN** du site (visible seulement pour toi) → section **CODES D'ACCRÉDITATION** → crée un code de niveau `MEMBRE` pour chaque nouvelle personne que tu accrédites.

## Structure du projet

- `index.html` — connexion / inscription
- `dashboard.html` — import et archivage des fiches (les 6 types)
- `archives.html` — consultation des fiches archivées, avec liens cliquables
- `monitor.html` — Core Monitor (statistiques en direct)
- `admin.html` — gestion des membres et des codes d'accréditation
- `sql/schema.sql` — schéma complet de la base de données
- `css/style.css` — thème visuel terminal/hacker
- `js/` — logique du site
