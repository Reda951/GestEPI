import express from 'express';
import { EPIModel } from '../models/EPIModel';

const router = express.Router();

// GET /epis - Récupérer tous les EPI
router.get('/', async (req, res) => {
  try {
    const epis = await EPIModel.findAll();
    res.json(epis);
  } catch (err) {
    console.error('Erreur GET /epis', err);
    res.status(500).json({ message: 'Erreur serveur' });
  }
});

// POST /epis - Créer un nouvel EPI
router.post('/', async (req, res) => {
  try {
    const epi = await EPIModel.create(req.body);
    res.status(201).json(epi);
  } catch (err) {
    console.error('Erreur POST /epis', err);
    res.status(400).json({ message: 'Erreur lors de la création de l\'EPI' });
  }
});

// PUT /epis/:id - Modifier un EPI existant
router.put('/:id', async (req, res) => {
  try {
    const epi = await EPIModel.findByPk(req.params.id);
    if (!epi) return res.status(404).json({ message: 'EPI non trouvé' });

    await epi.update(req.body);
    res.json(epi);
  } catch (err) {
    console.error('Erreur PUT /epis/:id', err);
    res.status(500).json({ message: 'Erreur serveur' });
  }
});

// DELETE /epis/:id - Supprimer un EPI
router.delete('/:id', async (req, res) => {
  try {
    const deleted = await EPIModel.destroy({ where: { id: req.params.id } });
    if (!deleted) return res.status(404).json({ message: 'EPI non trouvé' });

    res.json({ message: 'EPI supprimé avec succès' });
  } catch (err) {
    console.error('Erreur DELETE /epis/:id', err);
    res.status(500).json({ message: 'Erreur serveur' });
  }
});

export default router;
