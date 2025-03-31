//********** Imports **********//
import express from "express";
import cors from "cors";
import * as middlewares from "./middlewares";
import episRoutes from './routes/epis';
import controlesRoutes from './routes/controles';

require("dotenv").config();

//********** Server **********//
const allowedOrigins = ["http://localhost:3000", "http://127.0.0.1:3000"];

const options: cors.CorsOptions = {
  origin: allowedOrigins,
};

const app = express();

app.use(cors(options));
app.use(express.json());

// 🚀 Brancher les routes ici
app.use('/epis', episRoutes);
app.use('/controles', controlesRoutes);

// Middleware d'erreur
app.use(middlewares.notFound);
app.use(middlewares.errorHandler);

export default app;
