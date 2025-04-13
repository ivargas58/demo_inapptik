import express from 'express';

const app = express();

// Ruta raíz
app.get('/', (req, res) => {
    res.send('Hola, Mundo!');
});

// Configuración del puerto
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Servidor corriendo en el puerto ${PORT}`);
});
