-- =========================================================
-- DONNÉES DE DÉPART — intrigue "fichiers disparus"
-- À COLLER une seule fois dans : Supabase → SQL Editor → RUN
-- (peut être modifié/adapté avant de lancer, ou relancé après avoir
--  vidé les archives depuis le panneau admin)
-- =========================================================

insert into fiches (type, number, archive_id, content, links, author_id, corrupted, created_at) values

-- PERSON ---------------------------------------------------
('person', 1, 'PERSON_001',
'TYPE : PERSON
NOM : Alia Voss
ÂGE : 34
ORIGINE : Secteur 7
PROFESSION : Ingénieure biotech indépendante
LOCALISATION : District Sud
CONTACT : signal crypté #4471
DESCRIPTION : Contact régulier de Kieran, spécialisée en interfaces neuronales.
RELATIONS : Collègue de laboratoire
NOTES : Fiable, prudente.', '{}', null, false, '2026-08-15 10:00:00+02'),

('person', 2, 'PERSON_002',
'TYPE : PERSON
NOM : Marek Osei
ÂGE : 41
ORIGINE : Zone Franche Nord
PROFESSION : Courtier en données
LOCALISATION : inconnue, mobile
CONTACT : relais anonyme
DESCRIPTION : Vend des accès à des bases fermées. Source occasionnelle.
RELATIONS : Aucune connue
NOTES : À surveiller.', '{}', null, false, '2026-09-01 14:30:00+02'),

('person', 4, 'PERSON_004',
'TYPE : PERSON
NOM : [PARTIEL] — Voss ?
ÂGE : inconnu
ORIGINE : inconnue
PROFESSION : inconnue
LOCALISATION : dernière position connue — Secteur 7
CONTACT : injoignable depuis 3 semaines
DESCRIPTION : Tentative de reprise de contact après la coupure. Aucune réponse.
RELATIONS : voir PERSON_001
NOTES : Correspond-il à Alia Voss ? Vérification impossible, fiche PERSON_003 manquante.', '{}', null, false, '2026-09-26 09:15:00+02'),

-- MEMORY ---------------------------------------------------
('memory', 1, 'MEMORY_001',
'TYPE : MEMORY
TITRE : Rencontre au Terminal 9
DATE : 15/08/2026
LIEU : Terminal 9, zone industrielle
PERSONNES : Kieran Vale, Alia Voss
CONTENU : Première discussion sur les capacités de la BNI concernant les implants.
IMPORTANCE : Moyenne
NOTES : À recouper avec PERSON_001.', '{}', null, false, '2026-08-15 18:00:00+02'),

('memory', 2, 'MEMORY_002',
'TYPE : MEMORY
TITRE : Interception d''un flux non identifié
DATE : 28/08/2026
LIEU : Réseau local, serveur relais 3
PERSONNES : Kieran Vale
CONTENU : Un flux de données chiffré a transité par le noyau sans avoir été demandé.
IMPORTANCE : Élevée
NOTES : Origine jamais identifiée.', '{}', null, false, '2026-08-28 22:10:00+02'),

('memory', 4, 'MEMORY_004',
'TYPE : MEMORY
TITRE : Redémarrage du noyau d''archivage
DATE : 26/09/2026
LIEU : REPLAY CORE
PERSONNES : Kieran Vale
CONTENU : Reprise des enregistrements après une coupure de 21 jours. Aucun journal d''erreur retrouvé pour la période.
IMPORTANCE : Critique
NOTES : Voir bannière d''incident.', '{}', null, false, '2026-09-26 09:00:00+02'),

-- EVENT ------------------------------------------------------
('event', 1, 'EVENT_001',
'TYPE : EVENT
NOM : Panne du Secteur 7
DATE : 20/08/2026
LIEU : Secteur 7
PARTICIPANTS : Techniciens locaux
DESCRIPTION : Coupure de courant de 6 heures, cause officielle : surcharge.
CONSÉQUENCES : Aucune donnée perdue à l''époque.
NOTES : Premier signe avant-coureur ?', '{}', null, false, '2026-08-20 08:00:00+02'),

('event', 2, 'EVENT_002',
'TYPE : EVENT
NOM : Livraison suspecte
DATE : 01/09/2026
LIEU : Quai de fret 12
PARTICIPANTS : Marek Osei, inconnus (x2)
DESCRIPTION : Échange rapide de matériel non identifié.
CONSÉQUENCES : Surveillance renforcée décidée par Kieran.
NOTES : Lien possible avec la BNI.', '{}', null, false, '2026-09-01 20:45:00+02'),

('event', 4, 'EVENT_004',
'TYPE : EVENT
NOM : Réactivation du noyau
DATE : 26/09/2026
LIEU : REPLAY CORE
PARTICIPANTS : Kieran Vale
DESCRIPTION : Le système redevient opérationnel sans explication du silence des 3 dernières semaines.
CONSÉQUENCES : Ouverture d''une enquête informelle.
NOTES : —', '{}', null, false, '2026-09-26 09:30:00+02'),

-- ANOMALY ----------------------------------------------------
('anomaly', 1, 'ANOMALY_001',
'TYPE : ANOMALY
NOM : Résonance inexpliquée
NATURE : Électromagnétique
LOCALISATION : Secteur 7
DATE : 22/08/2026
DESCRIPTION : Pics de résonance détectés près des serveurs relais, cause non identifiée.
NIVEAU DE RISQUE : Faible
NOTES : À surveiller.', '{}', null, false, '2026-08-22 11:20:00+02'),

('anomaly', 2, 'ANOMALY_002',
'TYPE : ANOMALY
NOM : Signature biométrique fantôme
NATURE : Biotech
LOCALISATION : Laboratoire Sud
DATE : 30/08/2026
DESCRIPTION : Une signature biométrique inconnue a été enregistrée puis effacée en quelques secondes.
NIVEAU DE RISQUE : Moyen
NOTES : Aucune correspondance dans le registre PERSON.', '{}', null, false, '2026-08-30 16:40:00+02'),

('anomaly', 4, 'ANOMALY_004',
'TYPE : ANOMALY
NOM : Silence du noyau
NATURE : Système
LOCALISATION : REPLAY CORE
DATE : 26/09/2026
DESCRIPTION : 21 jours sans le moindre enregistrement, alors que le système indique un fonctionnement continu durant toute la période.
NIVEAU DE RISQUE : Élevé
NOTES : Anomalie centrale de l''intrigue actuelle.', '{}', null, true, '2026-09-26 09:45:00+02'),

-- FRAGMENT -----------------------------------------------------
('fragment', 1, 'FRAGMENT_001',
'TYPE : FRAGMENT
TITRE : Extrait audio corrompu
SOURCE : Relais radio Nord
DATE : 18/08/2026
CONTENU : "...ne peuvent pas savoir... avant le vingt-cinq..."
ORIGINE : Inconnue
SIGNIFICATION : Non déterminée
NOTES : Phrase incomplète, à recouper.', '{}', null, false, '2026-08-18 21:00:00+02'),

('fragment', 2, 'FRAGMENT_002',
'TYPE : FRAGMENT
TITRE : Ligne de code isolée
SOURCE : Serveur relais 3
DATE : 29/08/2026
CONTENU : PURGE_SCHEDULED :: 04-09-2026 :: TARGET=ALL
ORIGINE : Inconnue
SIGNIFICATION : Coïncide avec le début de la période disparue.
NOTES : À analyser en priorité.', '{}', null, false, '2026-08-29 13:15:00+02'),

('fragment', 4, 'FRAGMENT_004',
'TYPE : FRAGMENT
TITRE : Trace résiduelle
SOURCE : Noyau d''archivage
DATE : 26/09/2026
CONTENU : ...RESTORE_FAILED :: PARTIAL...
ORIGINE : Système
SIGNIFICATION : Une tentative de restauration aurait échoué.
NOTES : Corrobore FRAGMENT_002.', '{}', null, true, '2026-09-26 10:00:00+02'),

-- DATA -----------------------------------------------------
('data', 1, 'DATA_001',
'TYPE : DATA
IDENTIFIANT : DX-1187
SOURCE : Laboratoire Sud
DATE : 19/08/2026
CATÉGORIE : Biométrie
CONTENU : Relevés de tests sur implants neuronaux, phase 2.
STATUT : Validé
NOTES : —', '{}', null, false, '2026-08-19 09:30:00+02'),

('data', 2, 'DATA_002',
'TYPE : DATA
IDENTIFIANT : DX-1194
SOURCE : Serveur relais 3
DATE : 02/09/2026
CATÉGORIE : Réseau
CONTENU : Cartographie des connexions entrantes/sortantes du noyau.
STATUT : En cours d''analyse
NOTES : Dernière entrée avant la coupure.', '{}', null, false, '2026-09-02 17:00:00+02'),

('data', 4, 'DATA_004',
'TYPE : DATA
IDENTIFIANT : DX-1195
SOURCE : Noyau d''archivage
DATE : 26/09/2026
CATÉGORIE : Système
CONTENU : Journal de redémarrage. Aucune anomalie de démarrage détectée malgré la coupure.
STATUT : Non résolu
NOTES : Premier fichier post-incident.', '{}', null, false, '2026-09-26 10:15:00+02');

-- Met les compteurs à jour pour que le prochain archivage continue
-- correctement (numéro 005 pour chaque type), sans toucher au trou
-- volontaire laissé sur le numéro 003.
update counters set count = 4 where type in ('person','memory','event','anomaly','fragment','data');

-- Active la bannière d'incident avec un texte prêt à l'emploi
update settings set value = 'true' where key = 'incident_enabled';
update settings set value = 'INTÉGRITÉ DES DONNÉES NON CONFIRMÉE.

Période concernée : 04/09/2026 → 25/09/2026 (21 jours)
Fichiers affectés : PERSON / MEMORY / EVENT / ANOMALY / FRAGMENT / DATA
Statut : ABSENTS DU REGISTRE — cause inconnue

Aucune trace de suppression manuelle détectée.
Aucune trace de sauvegarde correspondante.

> Toute information relative à cette période est à signaler.' where key = 'incident_text';

-- Quelques lignes pour le journal système
insert into system_log (entry_date, message) values
('2026-09-04', 'ERREUR I/O — SECTEUR 7'),
('2026-09-12', 'ACCÈS NON AUTORISÉ DÉTECTÉ'),
('2026-09-25', 'REDÉMARRAGE AUTOMATIQUE DU NOYAU'),
('2026-09-26', 'JOURNALISATION RÉTABLIE — 21 JOURS SANS ENREGISTREMENT');
