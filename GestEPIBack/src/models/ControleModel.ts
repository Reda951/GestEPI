import { DataTypes } from 'sequelize';
import { sequelize } from '../sequelize';
import { EPIModel } from './EPIModel';

export const ControleModel = sequelize.define('Controle', {
  id: {
    type: DataTypes.STRING,
    primaryKey: true,
  },
  date: DataTypes.STRING,
  gestionnaire: DataTypes.STRING,
  statut: DataTypes.STRING,
  remarques: DataTypes.STRING,
});

ControleModel.belongsTo(EPIModel, {
  foreignKey: 'epiId',
});
