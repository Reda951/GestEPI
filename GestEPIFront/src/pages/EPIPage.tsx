import React, { useEffect, useState } from 'react';
import axios from 'axios';
import {
  Box,
  Button,
  Typography,
  IconButton,
  Stack,
} from '@mui/material';
import {
  DataGrid,
  GridColDef,
} from '@mui/x-data-grid';
import { Delete, Edit, Add } from '@mui/icons-material';
import { EPI, TypeEPI, Controle } from 'gestepi-interfaces-reda';

const EPIPage: React.FC = () => {
  const [epis, setEpis] = useState<EPI[]>([]);
  const [controles, setControles] = useState<Controle[]>([]);
  const [showForm, setShowForm] = useState(false);
  const [isEditing, setIsEditing] = useState(false);
  const [editId, setEditId] = useState<string | null>(null);

  const [formData, setFormData] = useState<EPI>({
    id: '',
    marque: '',
    modele: '',
    numeroSerie: '',
    type: TypeEPI.TEXTILE,
    taille: '',
    couleur: '',
    dateAchat: '',
    dateFabrication: '',
    dateMiseEnService: '',
    periodiciteControle: 180,
    controles: [],
  });

  useEffect(() => {
    axios.get('http://localhost:5501/epis')
      .then(res => setEpis(res.data))
      .catch(err => console.error('Erreur GET /epis', err));

    axios.get('http://localhost:5501/controles')
      .then(res => setControles(res.data))
      .catch(err => console.error('Erreur GET /controles', err));
  }, []);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };

  const resetForm = () => {
    setFormData({
      id: '',
      marque: '',
      modele: '',
      numeroSerie: '',
      type: TypeEPI.TEXTILE,
      taille: '',
      couleur: '',
      dateAchat: '',
      dateFabrication: '',
      dateMiseEnService: '',
      periodiciteControle: 180,
      controles: [],
    });
    setIsEditing(false);
    setEditId(null);
  };

  const handleSubmit = () => {
    if (isEditing && editId) {
      axios.put(`http://localhost:5501/epis/${editId}`, formData)
        .then(res => {
          setEpis(epis.map(epi => epi.id === editId ? res.data : epi));
          resetForm();
          setShowForm(false);
        })
        .catch(err => console.error('Erreur PUT /epis', err));
    } else {
      axios.post('http://localhost:5501/epis', formData)
        .then(res => {
          setEpis([...epis, res.data]);
          resetForm();
          setShowForm(false);
        })
        .catch(err => console.error('Erreur POST /epis', err));
    }
  };

  const handleDelete = (id: string) => {
    axios.delete(`http://localhost:5501/epis/${id}`)
      .then(() => {
        setEpis(epis.filter(epi => epi.id !== id));
      })
      .catch(err => console.error('Erreur DELETE /epis', err));
  };

  const getFrequenceLabel = (jours: number) => {
    if (jours === 30) return 'Tous les 1 mois';
    if (jours === 180) return 'Tous les 6 mois';
    if (jours === 365) return 'Tous les 1 an';
    return `Tous les ${jours} jours`;
  };

  const getDernierControle = (epiId: string): Controle | undefined => {
    const controlesEPI = controles
      .filter(ctrl => ctrl.epiId === epiId)
      .sort((a, b) => new Date(b.date).getTime() - new Date(a.date).getTime());
    return controlesEPI[0];
  };

  const isControleBientotDu = (epi: EPI): boolean => {
    const dernier = getDernierControle(epi.id);
    if (!dernier) return true;
    const prochaineDate = new Date(dernier.date);
    prochaineDate.setDate(prochaineDate.getDate() + epi.periodiciteControle);
    const now = new Date();
    const diff = (prochaineDate.getTime() - now.getTime()) / (1000 * 60 * 60 * 24);
    return diff <= 15;
  };

  const columns: GridColDef[] = [
    {
      field: 'actions',
      headerName: 'Actions',
      width: 100,
      sortable: false,
      renderCell: (params) => {
        const epi = params.row as EPI;
        return (
          <Stack direction="row" spacing={1}>
            <IconButton
              size="small"
              onClick={() => {
                setFormData(epi);
                setEditId(epi.id);
                setIsEditing(true);
                setShowForm(true);
              }}
            >
              <Edit fontSize="small" />
            </IconButton>
            <IconButton
              size="small"
              color="error"
              onClick={() => handleDelete(epi.id)}
            >
              <Delete fontSize="small" />
            </IconButton>
          </Stack>
        );
      },
    },
    { field: 'id', headerName: 'ID', width: 100 },
    { field: 'numeroSerie', headerName: 'N° série', width: 150 },
    { field: 'marque', headerName: 'Marque', width: 120 },
    { field: 'modele', headerName: 'Modèle', width: 120 },
    { field: 'type', headerName: 'Type', width: 100 },
    { field: 'taille', headerName: 'Taille', width: 100 },
    { field: 'couleur', headerName: 'Couleur', width: 100 },
    {
      field: 'dateAchat',
      headerName: "Date d'achat",
      width: 130,
      valueFormatter: (params: any) =>
        params?.value ? new Date(params.value).toLocaleDateString() : '',
    },
    {
      field: 'dateFabrication',
      headerName: 'Date fab.',
      width: 130,
      valueFormatter: (params: any) =>
        params?.value ? new Date(params.value).toLocaleDateString() : '',
    },
    {
      field: 'dateMiseEnService',
      headerName: 'Date mise en service',
      width: 160,
      valueFormatter: (params: any) =>
        params?.value ? new Date(params.value).toLocaleDateString() : '',
    },
    {
      field: 'periodiciteControle',
      headerName: 'Fréquence contrôle',
      width: 160,
      valueFormatter: (params: any) =>
        params?.value ? getFrequenceLabel(params.value) : '',
    },
    {
      field: 'alerte',
      headerName: '⚠️ Alerte',
      width: 180,
      sortable: false,
      valueFormatter: (params: any) =>
        params?.row ? (isControleBientotDu(params.row) ? '🚨 À contrôler bientôt' : '') : '',
    },
  ];

  return (
    <Box p={3}>
      <Typography variant="h5" gutterBottom>Liste des EPI</Typography>

      <Box display="flex" justifyContent="flex-end" mb={2}>
        <Button
          variant="contained"
          startIcon={<Add />}
          onClick={() => {
            if (showForm) {
              setShowForm(false);
              resetForm();
            } else {
              setIsEditing(false);
              setEditId(null);
              setFormData({
                id: '',
                marque: '',
                modele: '',
                numeroSerie: '',
                type: TypeEPI.TEXTILE,
                taille: '',
                couleur: '',
                dateAchat: '',
                dateFabrication: '',
                dateMiseEnService: '',
                periodiciteControle: 180,
                controles: [],
              });
              setShowForm(true);
            }
          }}
        >
          {showForm ? 'Fermer le formulaire' : 'Ajouter un EPI'}
        </Button>
      </Box>

      {showForm && (
        <Box mb={4}>
          <Typography variant="h6">
            {isEditing ? 'Modifier un EPI' : 'Ajouter un EPI'}
          </Typography>
          <Stack direction="row" spacing={2} flexWrap="wrap" mt={1}>
            <input placeholder="ID" name="id" value={formData.id} onChange={handleChange} />
            <input placeholder="Marque" name="marque" value={formData.marque} onChange={handleChange} />
            <input placeholder="Modèle" name="modele" value={formData.modele} onChange={handleChange} />
            <input placeholder="N° Série" name="numeroSerie" value={formData.numeroSerie} onChange={handleChange} />
            <input placeholder="Taille" name="taille" value={formData.taille} onChange={handleChange} />
            <input placeholder="Couleur" name="couleur" value={formData.couleur} onChange={handleChange} />
            <input type="date" name="dateAchat" value={formData.dateAchat} onChange={handleChange} />
            <input type="date" name="dateFabrication" value={formData.dateFabrication} onChange={handleChange} />
            <input type="date" name="dateMiseEnService" value={formData.dateMiseEnService} onChange={handleChange} />
            <input type="number" name="periodiciteControle" value={formData.periodiciteControle} onChange={handleChange} />
            <Button variant="contained" onClick={handleSubmit}>
              {isEditing ? 'Modifier' : 'Enregistrer'}
            </Button>
          </Stack>
        </Box>
      )}

      <DataGrid
        rows={epis}
        columns={columns}
        getRowId={(row) => row.id}
        autoHeight
        pageSizeOptions={[5, 10, 50]}
      />
    </Box>
  );
};

export default EPIPage;
