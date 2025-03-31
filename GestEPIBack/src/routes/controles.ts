import express from 'express';
import { ControleModel } from '../models/ControleModel';

const router = express.Router();

// GET /controles - Liste des contrôles
router.get('/', async (req, res) => {
  const controles = await ControleModel.findAll();
  res.json(controles);
});

// POST /controles - Ajouter un contrôle
router.post('/', async (req, res) => {
  try {
    const controle = await ControleModel.create(req.body);
    res.status(201).json(controle);
  } catch (err) {
    res.status(400).json({ error: 'Erreur lors de la création du contrôle' });
  }
});

export default router;
