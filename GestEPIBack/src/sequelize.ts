import { Sequelize } from 'sequelize';

// 🔧 À adapter selon ton mot de passe, nom de BDD, etc.
export const sequelize = new Sequelize('gestepi', 'root', 'reda', {
  host: 'localhost',
  dialect: 'mariadb',
  logging: false, // optionnel : désactive les logs SQL
});
