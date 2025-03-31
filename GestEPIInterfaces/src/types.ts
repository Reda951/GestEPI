// Type d’EPI pour savoir si textile (à renouveler tous les 10 ans) ou métallique
export enum TypeEPI {
    TEXTILE = "TEXTILE",
    METALLIQUE = "METALLIQUE",
  }
  
  // Statuts possibles après un contrôle
  export enum StatutEPI {
    OPERATIONNEL = "OPERATIONNEL",
    A_REPARER = "A_REPARER",
    MIS_AU_REBUT = "MIS_AU_REBUT",
  }
  
  // Interface EPI
  export interface EPI {
    id: string; // identifiant unique personnalisé (fourni par le gestionnaire)
    marque: string;
    modele: string;
    numeroSerie: string;
  
    type: TypeEPI;
  
    taille?: string;
    couleur?: string;
  
    dateAchat: string; // format ISO
    dateFabrication: string;
    dateMiseEnService: string;
  
    periodiciteControle: number; // en jours
  
    controles?: Controle[]; // historique des contrôles
  }
  
  // Interface Contrôle
  export interface Controle {
    id: string;
    date: string; // date du contrôle
    gestionnaire: string; // nom de la personne qui contrôle
    epiId: string; // lien vers l’EPI contrôlé
    statut: StatutEPI;
    remarques?: string;
  }
  