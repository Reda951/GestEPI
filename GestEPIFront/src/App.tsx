import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Layout from './components/Layout';
import EPIPage from './pages/EPIPage';
import ControlePage from './pages/ControlePage';

function App() {
  return (
    <Router>
      <Layout>
        <Routes>
          <Route path="/" element={<EPIPage />} />
          <Route path="/controles" element={<ControlePage />} />
        </Routes>
      </Layout>
    </Router>
  );
}

export default App;
