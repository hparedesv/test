const express = require('express');
const router = express.Router();
const entityController = require('../controllers/entityController');
const jwtController = require('../middlewares/jwt'); // Asegúrate de que la ruta sea correcta

// Crear una nueva tabla
router.post('/create-table', jwtController.authenticateToken, entityController.createTable);

// Agregar datos a una tabla
router.post('/add-data/:tableName', jwtController.authenticateToken, entityController.addData);

// Editar datos en una tabla
router.put('/edit-data/:tableName/:id', jwtController.authenticateToken, entityController.editData);

// Eliminar datos de una tabla
router.delete('/delete-data/:tableName/:id', jwtController.authenticateToken, entityController.deleteData);

// Eliminar una tabla
router.delete('/delete-table/:tableName', jwtController.authenticateToken, entityController.deleteTable);

// Obtener todas las tablas (entidades)
router.get('/all-tables', jwtController.authenticateToken, entityController.getAllTables); // Proteger la ruta

// Obtener datos de una tabla específica
router.get('/table-data/:tableName', jwtController.authenticateToken, entityController.getTableData);
// Editar una tabla existente
router.put('/edit-table', jwtController.authenticateToken, entityController.editTable);

// Obtener la estructura de una tabla
router.get('/table-structure/:tableName', jwtController.authenticateToken, entityController.getTableStructure); // Nueva ruta protegida
module.exports = router;
