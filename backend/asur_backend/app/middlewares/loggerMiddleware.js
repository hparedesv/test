// loggerMiddleware.js
const loggerMiddleware = (req, res, next) => {
    const start = Date.now(); // Tiempo de inicio

    // Almacenar la información de la solicitud
    console.log(`Método: ${req.method}, Ruta: ${req.originalUrl}`);

    // Función para manejar el fin de la respuesta
    res.on('finish', () => {
        const duration = Date.now() - start; // Calcular el tiempo de respuesta
        console.log(`Respuesta: ${res.statusCode}, Tiempo de respuesta: ${duration}ms`);
    });

    next(); // Pasar al siguiente middleware o ruta
};

module.exports = loggerMiddleware;
