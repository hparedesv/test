const User = require('../models/User');
const { Op } = require('sequelize');
const { body, validationResult } = require('express-validator');
const bcrypt = require('bcrypt');
exports.getAllUsers = async (req, res) => {
    const users = await User.findAll();
    res.json(users);
};

exports.getUserById = async (req, res) => {
    const user = await User.findByPk(req.params.id);
    if (user) res.json(user);
    else res.status(404).json({ message: 'Usuario no encontrado' });
};

exports.createUser = [
    body('name').notEmpty().withMessage('El nombre es requerido.'),
    body('email')
        .isEmail().withMessage('El email debe ser válido.')
        .custom(async (value) => {
            const existingUser = await User.findOne({ where: { email: value } });
            if (existingUser) {
                throw new Error('El correo electrónico ya está en uso.');
            }
        }),
    body('username')
        .notEmpty().withMessage('El nombre de usuario es requerido.')
        .custom(async (value) => {
            const existingUser = await User.findOne({ where: { username: value } });
            if (existingUser) {
                throw new Error('El nombre de usuario ya está en uso.');
            }
        }),
    body('password')
        .isLength({ min: 8 }).withMessage('La contraseña debe tener al menos 8 caracteres.')
        .matches(/\d/).withMessage('La contraseña debe contener al menos un número.')
        .matches(/[A-Z]/).withMessage('La contraseña debe contener al menos una letra mayúscula.'),

    async (req, res) => {
        // Verificar si hay errores de validación
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json({ errors: errors.array() });
        }

        try {
            // Crear el usuario
            const user = await User.create(req.body);
            // Devolver el usuario creado con estado 201
            res.status(201).json(user);
        } catch (error) {
            // Manejar errores y devolver mensaje
            res.status(400).json({ message: error.message });
        }
    }
];

exports.updateUser = [
    // Validaciones
    body('name').optional().notEmpty().withMessage('El nombre es requerido.'),
    body('email')
        .optional()
        .isEmail().withMessage('El email debe ser válido.')
        .custom(async (value, { req }) => {
            const existingUser = await User.findOne({ where: { email: value, id: { [Op.ne]: req.params.id } } });
            if (existingUser) {
                throw new Error('El correo electrónico ya está en uso.');
            }
        }),
    body('username')
        .optional()
        .notEmpty().withMessage('El nombre de usuario es requerido.')
        .custom(async (value, { req }) => {
            const existingUser = await User.findOne({ where: { username: value, id: { [Op.ne]: req.params.id } } });
            if (existingUser) {
                throw new Error('El nombre de usuario ya está en uso.');
            }
        }),
    body('password')
        .optional()
        .isLength({ min: 8 }).withMessage('La contraseña debe tener al menos 8 caracteres.')
        .matches(/\d/).withMessage('La contraseña debe contener al menos un número.')
        .matches(/[A-Z]/).withMessage('La contraseña debe contener al menos una letra mayúscula.'),

    async (req, res) => {
        // Verificar si hay errores de validación
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json({ errors: errors.array() });
        }

        try {
            // Obtener el usuario existente
            const user = await User.findByPk(req.params.id);
            if (!user) {
                return res.status(404).json({ error: 'Usuario no encontrado' });
            }

            // Actualizar solo los campos que se han proporcionado
            const updateData = { ...req.body };

            // Si se proporciona una nueva contraseña, encriptarla
            if (updateData.password) {
                const salt = await bcrypt.genSalt(10);
                updateData.password = await bcrypt.hash(updateData.password, salt);
            }

            // Actualizar el usuario
            const [updated] = await User.update(updateData, {
                where: { id: req.params.id },
                returning: true,
            });
            if (updated) {
                const updatedUser = await User.findByPk(req.params.id);
                res.json(updatedUser);
            } else {
                res.status(404).json({ error: 'Usuario no encontrado' });
            }
        } catch (error) {
            console.error('Error al actualizar el usuario:', error); // Agregar log para ver el error exacto
            res.status(400).json({ error: 'Error al actualizar el usuario', details: error.message });
        }
    }
];

exports.deleteUser = async (req, res) => {
    const deleted = await User.destroy({
        where: { id: req.params.id },
    });
    if (deleted) res.json({ message: 'Usuario eliminado' });
    else res.status(404).json({ message: 'Usuario no encontrado' });
};
