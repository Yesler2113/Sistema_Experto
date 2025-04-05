
import { useState } from 'react';
import './index.css'; 

function App() {
  const [plan, setPlan] = useState('principiante');
  const [objetivo, setObjetivo] = useState('perder_grasa'); 
  const [peso, setPeso] = useState('');
  const [altura, setAltura] = useState('');
  const [imcNumero, setIMCNumero] = useState(null);
  const [imcCategoria, setIMCCategoria] = useState('');
  const [rutina, setRutina] = useState([]);
  const [error, setError] = useState('');
  const [cargando, setCargando] = useState(false);

  const calcularIMC = () => {
    const alturaM = parseFloat(altura) / 100;
    const pesoKg = parseFloat(peso);

    if (!alturaM || !pesoKg || alturaM <= 0 || pesoKg <= 0) return null;

    const imc = pesoKg / (alturaM * alturaM);
    setIMCNumero(imc.toFixed(1));

    if (imc < 18.5) return 'bajo';
    else if (imc >= 18.5 && imc < 25) return 'normal';
    else return 'alto';
  };

  const obtenerRutina = async () => {
    if (!peso || !altura || !plan || !objetivo) {
      setError('Por favor completa todos los campos.');
      return;
    }

    const imc = calcularIMC();

    if (!imc) {
      setError('Valores de peso o altura inválidos.');
      return;
    }

    setError('');
    setIMCCategoria(imc);
    setCargando(true);
    setRutina([]);

    try {
      const res = await fetch('http://localhost:5000/rutina', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ plan, imc, objetivo }), 
      });

      if (!res.ok) {
        throw new Error('Error en la respuesta del servidor');
      }

      const data = await res.json();
      console.log(data); 
      setRutina(data.rutina);
    } catch (err) {
      setError('Error al conectar con el servidor Prolog: ' + err.message);
    } finally {
      setCargando(false);
    }
  };

  return (
    <div style={{ padding: '2rem', fontFamily: 'Arial' }}>
      <h1>Rutinas</h1>

      <label>Peso (kg):</label><br />
      <input type="number" value={peso} onChange={(e) => setPeso(e.target.value)} /><br /><br />

      <label>Altura (cm):</label><br />
      <input type="number" value={altura} onChange={(e) => setAltura(e.target.value)} /><br /><br />

      <label>Plan:</label><br />
      <select value={plan} onChange={(e) => setPlan(e.target.value)}>
        <option value="principiante">Principiante</option>
        <option value="intermedio">Intermedio</option>
        <option value="avanzado">Avanzado</option>
      </select><br /><br />

      <label>Objetivo:</label><br />
      <select value={objetivo} onChange={(e) => setObjetivo(e.target.value)}>
        <option value="perder_grasa">Perder grasa</option>
        <option value="ganar_musculo">Ganar músculo</option>
        <option value="mejorar_resistencia">Mejorar resistencia</option>
        <option value="aumentar_flexibilidad">Aumentar flexibilidad</option>
      </select><br /><br />

      <button onClick={obtenerRutina} disabled={cargando}>
        {cargando ? 'Cargando rutina...' : 'Obtener rutina'}
        {cargando && <span className="spinner" />}
      </button><br /><br />

      {error && <p style={{ color: 'red' }}>{error}</p>}

      {imcNumero && imcCategoria && (
        <p><strong>Tu IMC es:</strong> {imcNumero} ({imcCategoria})</p>
      )}

      {rutina.length > 0 && (
        <>
          <h2>Rutina recomendada:</h2>
          <ul>
            {rutina.map((ejercicio, index) => (
              <li key={index}>{ejercicio}</li>
            ))}
          </ul>
        </>
      )}
    </div>
  );
}

export default App;

