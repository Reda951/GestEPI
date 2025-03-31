"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.StatutEPI = exports.TypeEPI = void 0;
// Type d’EPI pour savoir si textile (à renouveler tous les 10 ans) ou métallique
var TypeEPI;
(function (TypeEPI) {
    TypeEPI["TEXTILE"] = "TEXTILE";
    TypeEPI["METALLIQUE"] = "METALLIQUE";
})(TypeEPI || (exports.TypeEPI = TypeEPI = {}));
// Statuts possibles après un contrôle
var StatutEPI;
(function (StatutEPI) {
    StatutEPI["OPERATIONNEL"] = "OPERATIONNEL";
    StatutEPI["A_REPARER"] = "A_REPARER";
    StatutEPI["MIS_AU_REBUT"] = "MIS_AU_REBUT";
})(StatutEPI || (exports.StatutEPI = StatutEPI = {}));
