//********** Imports **********//
import app from "./app";
import { sequelize } from './sequelize';
import { EPIModel } from './models/EPIModel';
import { ControleModel } from './models/ControleModel';

sequelize
  .authenticate()
  .then(() => {
    console.log('✅ Connecté à MariaDB');
    return sequelize.sync({ alter: true });
  })
  .then(() => {
    console.log('✅ Modèles synchronisés');
    const port = process.env.PORT || 5501;
    app.listen(port, () => {
      console.log(`Listening: http://localhost:${port}`);
    });
  })
  .catch((err) => {
    console.error('❌ Erreur de connexion ou sync Sequelize :', err);
  });
