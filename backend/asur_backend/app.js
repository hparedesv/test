const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const cors = require('cors');
const dotenv = require('dotenv');
const sequelize = require('./app/config/database'); // Configuración de Sequelize
const loggerMiddleware = require('./app/middlewares/loggerMiddleware');

dotenv.config();

const indexRouter = require('./app/routes/index');
const usersRouter = require('./app/routes/userRoutes');
const jwtRoutes = require('./app/routes/jwtRoutes');
const entityRoutes = require('./app/routes/entityRoutes');
const app = express();
const PORT = process.env.PORT || 3001;
// Habilitar CORS
app.use(cors({
    origin: 'http://localhost:4200',
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
    credentials: true
}));
// Middlewares
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(loggerMiddleware);
// Rutas
app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/auth', jwtRoutes);
app.use('/entities', entityRoutes);
// Sincronizar la base de datos y arrancar el servidor
sequelize.sync({ alter: true }) // Cambia esto a { alter: true } para ajustar la estructura sin eliminar datos
    .then(() => {
        app.listen(PORT, () => console.log(`Servidor ejecutándose en el puerto ${PORT}`));
        console.log('Conectado a la base de datos PostgreSQL y sincronizado');
    })
    .catch(error => {
        console.error('Error al sincronizar la base de datos:', error);
        process.exit(1);
    });

module.exports = app;
