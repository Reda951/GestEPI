export declare enum TypeEPI {
    TEXTILE = "TEXTILE",
    METALLIQUE = "METALLIQUE"
}
export declare enum StatutEPI {
    OPERATIONNEL = "OPERATIONNEL",
    A_REPARER = "A_REPARER",
    MIS_AU_REBUT = "MIS_AU_REBUT"
}
export interface EPI {
    id: string;
    marque: string;
    modele: string;
    numeroSerie: string;
    type: TypeEPI;
    taille?: string;
    couleur?: string;
    dateAchat: string;
    dateFabrication: string;
    dateMiseEnService: string;
    periodiciteControle: number;
    controles?: Controle[];
}
export interface Controle {
    id: string;
    date: string;
    gestionnaire: string;
    epiId: string;
    statut: StatutEPI;
    remarques?: string;
}
