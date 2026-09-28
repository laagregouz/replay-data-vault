// REPLAY CORE — modèles des 6 fiches (mêmes champs que sur Discord)

const FICHE_TYPES = {
  person: {
    label: "PERSON",
    title: "PERSON // IMPORT",
    template:
`TYPE : PERSON
NOM :
ÂGE :
ORIGINE :
PROFESSION :
LOCALISATION :
CONTACT :
DESCRIPTION :
RELATIONS :
NOTES :`
  },
  memory: {
    label: "MEMORY",
    title: "MEMORY // IMPORT",
    template:
`TYPE : MEMORY
TITRE :
DATE :
LIEU :
PERSONNES :
CONTENU :
IMPORTANCE :
NOTES :`
  },
  event: {
    label: "EVENT",
    title: "EVENT // IMPORT",
    template:
`TYPE : EVENT
NOM :
DATE :
LIEU :
PARTICIPANTS :
DESCRIPTION :
CONSÉQUENCES :
NOTES :`
  },
  anomaly: {
    label: "ANOMALY",
    title: "ANOMALY // IMPORT",
    template:
`TYPE : ANOMALY
NOM :
NATURE :
LOCALISATION :
DATE :
DESCRIPTION :
NIVEAU DE RISQUE :
NOTES :`
  },
  fragment: {
    label: "FRAGMENT",
    title: "FRAGMENT // IMPORT",
    template:
`TYPE : FRAGMENT
TITRE :
SOURCE :
DATE :
CONTENU :
ORIGINE :
SIGNIFICATION :
NOTES :`
  },
  data: {
    label: "DATA",
    title: "DATA // IMPORT",
    template:
`TYPE : DATA
IDENTIFIANT :
SOURCE :
DATE :
CATÉGORIE :
CONTENU :
STATUT :
NOTES :`
  }
};
