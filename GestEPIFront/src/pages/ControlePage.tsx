import React, { useEffect, useState } from 'react';
import axios from 'axios';
import {
  Box,
  Typography,
  Stack,
  Button,
  TextField,
  MenuItem,
  IconButton,
} from '@mui/material';
import { DataGrid, GridColDef } from '@mui/x-data-grid';
import { Delete } from '@mui/icons-material';
import { Controle, StatutEPI, EPI } from 'gestepi-interfaces-reda';

const ControlePage: React.FC = () => {
  const [formData, setFormData] = useState<Controle>({
    id: '',
    date: '',
    epiId: '',
    statut: StatutEPI.OPERATIONNEL,
    remarques: '',
    gestionnaire: '', // encore là si backend l'attend, mais masqué dans UI
  });

  const [epis, setEpis] = useState<EPI[]>([]);
  const [controles, setControles] = useState<Controle[]>([]);

  useEffect(() => {
    axios.get('http://localhost:5501/epis')
      .then(res => setEpis(res.data))
      .catch(err => console.error('Erreur GET /epis', err));

    axios.get('http://localhost:5501/controles')
      .then(res => setControles(res.data))
      .catch(err => console.error('Erreur GET /controles', err));
  }, []);

  const handleChange = (
    e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement | HTMLTextAreaElement>
  ) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSubmit = () => {
    axios.post('http://localhost:5501/controles', formData)
      .then(res => {
        setControles([...controles, res.data]);
        setFormData({
          id: '',
          date: '',
          epiId: '',
          statut: StatutEPI.OPERATIONNEL,
          remarques: '',
          gestionnaire: '',
        });
      })
      .catch(err => console.error('Erreur POST /controles', err));
  };

  const handleDelete = (id: string) => {
    axios.delete(`http://localhost:5501/controles/${id}`)
      .then(() => {
        setControles(controles.filter(ctrl => ctrl.id !== id));
      })
      .catch(err => console.error('Erreur DELETE /controles', err));
  };

  const displayStatut = (statut: string): string => {
    if (!statut) return '';
  return statut.replace(/_/g, ' ').replace(/\b\w/g, (l) => l.toUpperCase());
  };

  const columns: GridColDef[] = [
    {
      field: 'actions',
      headerName: '',
      width: 80,
      sortable: false,
      renderCell: (params) => (
        <IconButton color="error" onClick={() => handleDelete(params.row.id)}>
          <Delete fontSize="small" />
        </IconButton>
      ),
    },
    { field: 'id', headerName: 'ID', width: 100 },
    {
      field: 'epiId',
      headerName: 'EPI',
      width: 220,
      valueFormatter: (params: any) => {
        const epi = epis.find(e => e.id === params?.value);
        return epi ? `${epi.id} (${epi.marque} ${epi.modele})` : params?.value;
      },
    },
    { field: 'date', headerName: 'Date du contrôle', width: 150 },
    {
      field: 'statut',
      headerName: 'Statut',
      width: 160,
      valueFormatter: (params: any) => displayStatut(params?.value),
    },
    {
      field: 'remarques',
      headerName: 'Remarques',
      width: 300,
      renderCell: (params) => <span>{params?.value || '–'}</span>,
    },
  ];

  return (
    <Box p={3}>
      <Typography variant="h5" gutterBottom>Liste des contrôles</Typography>

      <Box my={3}>
        <Typography variant="h6" gutterBottom>Ajouter un contrôle</Typography>
        <Stack direction="row" spacing={2} flexWrap="wrap" mb={2}>
          <TextField
            name="id"
            label="ID"
            value={formData.id}
            onChange={handleChange}
          />
          <TextField
            type="date"
            name="date"
            label="Date"
            InputLabelProps={{ shrink: true }}
            value={formData.date}
            onChange={handleChange}
          />
          <TextField
            select
            name="epiId"
            label="EPI"
            value={formData.epiId}
            onChange={handleChange}
            sx={{ minWidth: 220 }}
          >
            {epis.map(epi => (
              <MenuItem key={epi.id} value={epi.id}>
                {epi.id} ({epi.marque} {epi.modele})
              </MenuItem>
            ))}
          </TextField>
          <TextField
            select
            name="statut"
            label="Statut"
            value={formData.statut}
            onChange={handleChange}
            sx={{ minWidth: 160 }}
          >
            {Object.values(StatutEPI).map((s) => (
              <MenuItem key={s} value={s}>
                {displayStatut(s)}
              </MenuItem>
            ))}
          </TextField>
          <TextField
            name="remarques"
            label="Remarques"
            value={formData.remarques}
            onChange={handleChange}
            multiline
            rows={3}
            sx={{ minWidth: 300 }}
          />
          <Button variant="contained" onClick={handleSubmit}>
            Enregistrer
          </Button>
        </Stack>
      </Box>

      <DataGrid
        rows={controles}
        columns={columns}
        getRowId={(row) => row.id}
        autoHeight
        pageSizeOptions={[5, 10, 50]}
      />
    </Box>
  );
};

export default ControlePage;
