import express from 'express';

const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
    res.send('Sesupone que ahora funcione ivancito vargas');
});

// Escucha en todas las interfaces (IP pública incluida)
app.listen(PORT, '0.0.0.0', () => {
    console.log(`Servidor corriendo en http://0.0.0.0:${PORT}`);
});
