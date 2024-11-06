// Importa las dependencias necesarias
var express = require('express');
var router = express.Router();
const sequelize = require('../config/database');


// Autentica la conexión a la base de datos
sequelize.authenticate()
    .then(() => console.log('Conectado a la base de datos PostgreSQL'))
    .catch(error => console.log('Error al conectar a la base de datos:', error));

// Define la ruta principal
router.get('/', function(req, res, next) {
  res.send('Bienvenido a la API'); // Puedes cambiar esto a un mensaje de bienvenida más sencillo si no usas vistas
});

module.exports = router;
