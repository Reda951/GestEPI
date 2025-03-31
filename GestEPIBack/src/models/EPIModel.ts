import { DataTypes } from 'sequelize';
import { sequelize } from '../sequelize';

export const EPIModel = sequelize.define('EPI', {
  id: {
    type: DataTypes.STRING,
    primaryKey: true,
  },
  marque: DataTypes.STRING,
  modele: DataTypes.STRING,
  numeroSerie: DataTypes.STRING,
  type: DataTypes.STRING,
  taille: DataTypes.STRING,
  couleur: DataTypes.STRING,
  dateAchat: DataTypes.STRING,
  dateFabrication: DataTypes.STRING,
  dateMiseEnService: DataTypes.STRING,
  periodiciteControle: DataTypes.INTEGER,
});
