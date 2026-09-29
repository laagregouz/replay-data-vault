-- =========================================================
-- DONNÉES DE DÉPART — intrigue "fichiers disparus"
-- Version alignée sur le lore officiel de GLIFE-REWIND
-- (San Andreas / Los Santos, districts, corporations, gangs)
-- À COLLER une seule fois dans : Supabase → SQL Editor → RUN
-- (peut être modifié/adapté avant de lancer, ou relancé après avoir
--  vidé les archives depuis le panneau admin)
-- =========================================================

insert into fiches (type, number, archive_id, content, links, author_id, corrupted, created_at) values

-- PERSON ---------------------------------------------------
('person', 1, 'PERSON_001',
'TYPE : PERSON
NOM : Ravi Morelos
ÂGE : ~50 ans (estimation)
ORIGINE : Crimson Salva
PROFESSION : Fixer — intermédiaire officieux du district
LOCALISATION : Crimson Salva, secteur des hangars désaffectés
CONTACT : relais chiffré local, changement de fréquence irrégulier
DESCRIPTION : Contact historique de Kieran depuis son installation à Crimson Salva. Connaît chaque recoin du district, des voies ferrées rouillées aux laboratoires clandestins qui n''apparaissent sur aucun registre officiel. Ne travaille pour aucune corpo, ne refuse jamais un service bien payé.
RELATIONS : fournit accès aux réseaux noirs, aux contrats et aux informations de terrain
NOTES : Fiable tant que le prix est bon. Ne pose jamais de questions sur l''usage fait de ses informations.', '{}', null, false, '2026-08-15 10:00:00+02'),

('person', 2, 'PERSON_002',
'TYPE : PERSON
NOM : Talia Voss
ÂGE : 30-35 ans (estimation)
ORIGINE : lisière ouest de Verdant Empire
PROFESSION : Courtière en données, contact occasionnel du réseau Sombra Fuerte
LOCALISATION : mobile — opère depuis un atelier de casse itinérant
CONTACT : canal crypté, rotation hebdomadaire des fréquences
DESCRIPTION : Vend des accès à des bases de données fermées, y compris certains registres corporatifs. Jamais confirmé, mais tout indique un lien avec les "Fantômes du Réseau" sans en porter les couleurs.
RELATIONS : source occasionnelle, aucun lien officiel déclaré
NOTES : À surveiller. Ses informations sont fiables mais jamais gratuites, et jamais désintéressées.', '{}', null, false, '2026-09-01 14:30:00+02'),

('person', 4, 'PERSON_004',
'TYPE : PERSON
NOM : [PARTIEL] — Voss ?
ÂGE : inconnu
ORIGINE : inconnue
PROFESSION : inconnue
LOCALISATION : dernière position connue — lisière de Verdant Empire
CONTACT : injoignable depuis 3 semaines
DESCRIPTION : Tentative de reprise de contact après la coupure du noyau. Aucune réponse sur les canaux habituels.
RELATIONS : voir PERSON_002
NOTES : Correspond-elle à Talia Voss ? Vérification impossible, fiche PERSON_003 manquante du registre.', '{}', null, false, '2026-09-26 09:15:00+02'),

-- MEMORY ---------------------------------------------------
('memory', 1, 'MEMORY_001',
'TYPE : MEMORY
TITRE : Rendez-vous au dépôt de fret
DATE : 15/08/2026
LIEU : Dépôt de fret abandonné, Crimson Salva
PERSONNES : Kieran Vale, Ravi Morelos
CONTENU : Discussion sur les mouvements récents observés autour des installations portuaires du district — présence inhabituelle de véhicules sans marque, sans plaque corporative visible.
IMPORTANCE : Moyenne
NOTES : À recouper avec PERSON_001 et EVENT_002.', '{}', null, false, '2026-08-15 18:00:00+02'),

('memory', 2, 'MEMORY_002',
'TYPE : MEMORY
TITRE : Interception d''un flux non identifié
DATE : 28/08/2026
LIEU : Relais réseau, lisière de Verdant Empire
PERSONNES : Kieran Vale
CONTENU : Un flux de données chiffré a transité par le noyau d''archivage sans avoir été demandé. Signature de compression inhabituelle, proche de ce que Talia Voss appelle les protocoles "réseau propre" du Lotus.
IMPORTANCE : Élevée
NOTES : Origine jamais formellement identifiée.', '{}', null, false, '2026-08-28 22:10:00+02'),

('memory', 4, 'MEMORY_004',
'TYPE : MEMORY
TITRE : Redémarrage du noyau d''archivage
DATE : 26/09/2026
LIEU : REPLAY CORE
PERSONNES : Kieran Vale
CONTENU : Reprise des enregistrements après une coupure de 21 jours. Aucun journal d''erreur retrouvé pour la période, alors que le système indique un fonctionnement continu.
IMPORTANCE : Critique
NOTES : Voir bannière d''incident.', '{}', null, false, '2026-09-26 09:00:00+02'),

-- EVENT ------------------------------------------------------
('event', 1, 'EVENT_001',
'TYPE : EVENT
NOM : Échange de tirs sur la ligne 9
DATE : 20/08/2026
LIEU : Crimson Salva, dépôt de fret ferroviaire
PARTICIPANTS : éléments non revendiqués — signes distinctifs compatibles avec Scar et Void
DESCRIPTION : Brève escarmouche entre deux groupes armés dans le secteur ferroviaire. Aucune revendication officielle, accès au secteur restreint pendant 48h par mesure de sécurité.
CONSÉQUENCES : aucune donnée archivée perdue à l''époque
NOTES : Premier signe avant-coureur ?', '{}', null, false, '2026-08-20 08:00:00+02'),

('event', 2, 'EVENT_002',
'TYPE : EVENT
NOM : Livraison suspecte au quai de fret
DATE : 01/09/2026
LIEU : Crimson Salva, quai de fret portuaire
PARTICIPANTS : individus non identifiés (x2), véhicule sans plaque
DESCRIPTION : Échange rapide de matériel non identifié, sans logo corporatif visible — profil qui correspond au mode opératoire prêté à Void dans le secteur.
CONSÉQUENCES : surveillance renforcée décidée par Kieran
NOTES : Lien possible avec MEMORY_001.', '{}', null, false, '2026-09-01 20:45:00+02'),

('event', 4, 'EVENT_004',
'TYPE : EVENT
NOM : Réactivation du noyau
DATE : 26/09/2026
LIEU : REPLAY CORE
PARTICIPANTS : Kieran Vale
DESCRIPTION : Le système redevient opérationnel sans explication du silence des 3 dernières semaines.
CONSÉQUENCES : ouverture d''une enquête informelle
NOTES : —', '{}', null, false, '2026-09-26 09:30:00+02'),

-- ANOMALY ----------------------------------------------------
('anomaly', 1, 'ANOMALY_001',
'TYPE : ANOMALY
NOM : Résonance inexpliquée
NATURE : Électromagnétique
LOCALISATION : Crimson Salva, périmètre du dépôt logistique portuaire
DATE : 22/08/2026
DESCRIPTION : Pics de résonance détectés près d''un site associé aux mouvements de Void, cause non identifiée.
NIVEAU DE RISQUE : Faible
NOTES : À surveiller.', '{}', null, false, '2026-08-22 11:20:00+02'),

('anomaly', 2, 'ANOMALY_002',
'TYPE : ANOMALY
NOM : Signature biométrique fantôme
NATURE : Biotech / Score Social
LOCALISATION : en marge du réseau de suivi Atelis
DATE : 30/08/2026
DESCRIPTION : Une signature biométrique inconnue a été enregistrée puis effacée en quelques secondes du registre S.S.S.
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
SOURCE : Relais radio, Crimson Salva
DATE : 18/08/2026
CONTENU : "...ne peuvent pas savoir... avant le vingt-cinq..."
ORIGINE : Inconnue
SIGNIFICATION : Non déterminée
NOTES : Phrase incomplète, à recouper.', '{}', null, false, '2026-08-18 21:00:00+02'),

('fragment', 2, 'FRAGMENT_002',
'TYPE : FRAGMENT
TITRE : Ligne de code isolée
SOURCE : Relais réseau, lisière de Verdant Empire
DATE : 29/08/2026
CONTENU : PURGE_SCHEDULED :: 04-09-2026 :: TARGET=ALL
ORIGINE : Inconnue
SIGNIFICATION : Coïncide avec le début de la période disparue. Le terme "PURGE" rappelle les méthodes prêtées au réseau Sombra Fuerte pour effacer une identité des registres.
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
SOURCE : fuite partielle, réseau Atelis
DATE : 19/08/2026
CATÉGORIE : Biométrie / Score Social
CONTENU : Fragments de relevés S.S.S. corrélés à un accès au Nova Life Medical Center.
STATUT : Validé
NOTES : —', '{}', null, false, '2026-08-19 09:30:00+02'),

('data', 2, 'DATA_002',
'TYPE : DATA
IDENTIFIANT : DX-1194
SOURCE : relais réseau
DATE : 02/09/2026
CATÉGORIE : Réseau
CONTENU : Cartographie des connexions entrantes/sortantes du noyau d''archivage.
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
('2026-09-04', 'ERREUR I/O — SECTEUR CRIMSON SALVA'),
('2026-09-12', 'ACCÈS NON AUTORISÉ DÉTECTÉ'),
('2026-09-25', 'REDÉMARRAGE AUTOMATIQUE DU NOYAU'),
('2026-09-26', 'JOURNALISATION RÉTABLIE — 21 JOURS SANS ENREGISTREMENT');
