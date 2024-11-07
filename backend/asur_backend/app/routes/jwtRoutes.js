const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');
const jwtController = require('../middlewares/jwt');

// Rutas públicas
router.post('/login', jwtController.login); // Ruta de inicio de sesión
// Rutas protegidas (requieren autenticación)
router.use(jwtController.authenticateToken);
router.put('/update/:id', jwtController.authenticateToken, userController.updateUser);
router.delete('/delete/:id', jwtController.authenticateToken, userController.deleteUser);

module.exports = router;
