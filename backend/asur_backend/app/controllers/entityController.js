const { DataTypes } = require('sequelize');

const sequelize = require('../config/database');
const mapModel = (tableName, data) => {
    // Eliminar el modelo existente si ya existe
    if (sequelize.models[tableName]) {
        delete sequelize.models[tableName];
    }

    const modelDefinition = {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        createdAt: {
            type: DataTypes.DATE,
            defaultValue: DataTypes.NOW,
        },
        updatedAt: {
            type: DataTypes.DATE,
            defaultValue: DataTypes.NOW,
        }
    };

    // Agregar los campos dinámicos
    const dynamicFields = Object.entries(data).reduce((acc, [name, value]) => {
        // Solo agregamos si no es uno de los campos de control
        if (name !== 'id' && name !== 'createdAt' && name !== 'updatedAt') {
            acc[name] = { type: DataTypes[typeof value === 'number' ? 'DOUBLE PRECISION' : 'TEXT'], allowNull: false };
        }
        return acc;
    }, {});

    const newModel = sequelize.define(tableName, {
        ...modelDefinition,
        ...dynamicFields
    }, {
        tableName: tableName,
        timestamps: true,
    });

    // Registrar el modelo en Sequelize
    sequelize.models[tableName] = newModel;

    // Consola para ver el modelo mapeado
    console.log(`Modelo mapeado para la tabla '${tableName}':`, newModel.rawAttributes);
};






exports.createTable = async (req, res) => {
    const { tableName, fields } = req.body;

    // Validación de nombres
    const validateName = (name) => {
        const regex = /^[a-z_]+$/; // Solo letras minúsculas y guiones bajos
        return regex.test(name);
    };

    // Validar el nombre de la tabla
    if (!validateName(tableName)) {
        return res.status(400).json({ message: 'El nombre de la tabla debe contener solo letras minúsculas y guiones bajos.' });
    }

    // Validar los nombres de los campos
    for (const field in fields) {
        if (!validateName(field)) {
            return res.status(400).json({ message: `El nombre del campo '${field}' debe contener solo letras minúsculas y guiones bajos.` });
        }
    }

    // Definir la consulta para verificar si la tabla ya existe
    const checkTableSQL = `SELECT to_regclass('${tableName}') AS table_exists;`;

    try {
        // Verificar si la tabla ya existe
        const [result] = await sequelize.query(checkTableSQL);
        if (result.table_exists) {
            return res.status(400).json({ message: `La tabla ${tableName} ya existe.` });
        }

        // Construir la definición de los campos
        const fieldDefinitions = Object.entries(fields)
            .map(([name, type]) => `${name} ${type.toUpperCase()}`)
            .join(', ');

        // Incluir el campo id, createdAt y updatedAt
        const createTableSQL = `CREATE TABLE ${tableName} (id SERIAL PRIMARY KEY, ${fieldDefinitions}, "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP, "updatedAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP);`;

        // Crear la tabla en la base de datos
        await sequelize.query(createTableSQL);

        // Definir el modelo dinámicamente
        const newModel = sequelize.define(tableName, {
            id: {
                type: DataTypes.INTEGER,
                primaryKey: true,
                autoIncrement: true,
            },
            ...Object.fromEntries(
                Object.entries(fields).map(([name, type]) => [name, { type: DataTypes[type.toUpperCase()], allowNull: false }])
            ),
            createdAt: {
                type: DataTypes.DATE,
                defaultValue: DataTypes.NOW,
            },
            updatedAt: {
                type: DataTypes.DATE,
                defaultValue: DataTypes.NOW,
            }
        }, {
            tableName: tableName, // Nombre de la tabla en la base de datos
            timestamps: true, // Si deseas incluir createdAt y updatedAt
        });

        // Registrar el modelo en Sequelize
        sequelize.models[tableName] = newModel;

        res.status(201).json({ message: `Tabla ${tableName} creada con éxito` });
    } catch (error) {
        console.error('Error al crear la tabla:', error);
        res.status(400).json({ error: 'Error al crear la tabla', details: error.message });
    }
};


exports.addData = async (req, res) => {
    const { tableName } = req.params;
    const data = req.body;

    try {
        // Verificar que 'data' no sea null, undefined, o un objeto vacío
        if (!data || typeof data !== 'object' || Object.keys(data).length === 0) {
            return res.status(400).json({ message: 'Datos no válidos' });
        }

        // Mapea el modelo antes de usarlo
        await mapModel(tableName, data); // Aquí pasamos también `data` para mapear correctamente

        const Table = sequelize.models[tableName];
        if (!Table) {
            return res.status(404).json({ message: 'Tabla no encontrada' });
        }

        // Aquí solo se debe pasar la data que no contiene 'id', 'createdAt', y 'updatedAt'
        const record = await Table.create(data);
        res.status(201).json(record);
    } catch (error) {
        console.error('Error al agregar datos:', error); // Para depuración
        res.status(500).json({ error: 'Error al agregar datos', details: error.message });
    }
};








exports.editData = async (req, res) => {
    const { tableName, id } = req.params;
    const data = req.body;

    try {
        // Verificar que 'data' no sea null, undefined, o un objeto vacío
        if (!data || typeof data !== 'object' || Object.keys(data).length === 0) {
            return res.status(400).json({ message: 'Datos no válidos' });
        }

        // Mapea el modelo antes de usarlo
        await mapModel(tableName, data); // Asegúrate de que el modelo esté mapeado correctamente

        const Table = sequelize.models[tableName];
        if (!Table) {
            return res.status(404).json({ message: 'Tabla no encontrada' });
        }

        // Actualizar el registro con el ID especificado
        const [updated] = await Table.update(data, { where: { id } });
        if (updated) {
            const updatedRecord = await Table.findByPk(id);
            res.json(updatedRecord);
        } else {
            res.status(404).json({ message: 'Registro no encontrado' });
        }
    } catch (error) {
        console.error('Error al editar datos:', error); // Para depuración
        res.status(500).json({ error: 'Error al editar datos', details: error.message });
    }
};


exports.deleteData = async (req, res) => {
    const { tableName, id } = req.params;

    try {
        const Table = sequelize.models[tableName];
        if (!Table) {
            return res.status(404).json({ message: 'Tabla no encontrada' });
        }

        const deleted = await Table.destroy({ where: { id } });
        if (deleted) {
            res.json({ message: 'Registro eliminado' });
        } else {
            res.status(404).json({ message: 'Registro no encontrado' });
        }
    } catch (error) {
        res.status(500).json({ error: 'Error al eliminar datos', details: error.message });
    }
};

exports.deleteTable = async (req, res) => {
    const { tableName } = req.params;

    try {
        // Intentar eliminar la tabla
        await sequelize.query(`DROP TABLE ${tableName};`);
        delete sequelize.models[tableName]; // Eliminar el modelo de Sequelize

        res.json({ message: `Tabla ${tableName} eliminada exitosamente.` });
    } catch (error) {
        // Retornar el error que proviene de la base de datos
        res.status(500).json({ error: 'Error al eliminar la tabla', details: error.message });
    }
};



exports.getAllTables = async (req, res) => {
    try {
        // Obtener todas las tablas existentes directamente desde la base de datos
        const [tables] = await sequelize.query(`
            SELECT table_name 
            FROM information_schema.tables 
            WHERE table_schema = 'public'
            AND table_type = 'BASE TABLE';
        `);

        // Verifica si hay tablas y extrae los nombres
        if (tables.length === 0) {
            return res.json([]); // Retorna un array vacío si no hay tablas
        }

        const tableNames = tables.map(table => table.table_name);
        res.json(tableNames); // Retorna los nombres de las tablas
    } catch (error) {
        console.error('Error al obtener las tablas:', error);
        res.status(500).json({ error: 'Error al obtener las tablas', details: error.message });
    }
};


exports.getTableData = async (req, res) => {
    const { tableName } = req.params;

    try {
        console.log(`Solicitando datos de la tabla: ${tableName}`);

        // Verificar si la tabla existe en la base de datos
        const checkTableSQL = `SELECT EXISTS (
            SELECT 1 
            FROM information_schema.tables 
            WHERE table_name = '${tableName}' 
            AND table_schema = 'public'
        ) AS table_exists;`;

        const [result] = await sequelize.query(checkTableSQL);
        console.log(`Verificación de existencia de tabla '${tableName}':`, result);

        if (result.table_exists) {
            return res.status(404).json({ message: 'Tabla no encontrada' });
        }

        // Obtener todos los registros de la tabla
        const records = await sequelize.query(`SELECT * FROM ${tableName};`);
        console.log(`Registros obtenidos de la tabla '${tableName}':`, records[0]);

        res.json(records[0]); // Retornar los registros de la tabla
    } catch (error) {
        console.error('Error al obtener los datos de la tabla:', error);
        res.status(500).json({ error: 'Error al obtener los datos de la tabla', details: error.message });
    }
};



exports.editTable = async (req, res) => {
    const { tableName, fields } = req.body;

    const validateName = (name) => {
        const regex = /^[a-z_]+$/; // Solo letras minúsculas y guiones bajos
        return regex.test(name);
    };

    try {
        const lowerTableName = tableName.toLowerCase();

        // Verificar si la tabla existe
        const checkTableSQL = `SELECT EXISTS (
            SELECT 1 
            FROM information_schema.tables 
            WHERE table_name = '${lowerTableName}' 
            AND table_schema = 'public'
        ) AS table_exists;`;

        const [result] = await sequelize.query(checkTableSQL);
        console.log(`Verificación de existencia de tabla '${lowerTableName}':`, result);

        if (result.table_exists) {
            return res.status(404).json({ message: `La tabla ${tableName} no existe.` });
        }

        // Validar el nombre de la tabla
        if (!validateName(lowerTableName)) {
            return res.status(400).json({ message: 'El nombre de la tabla debe contener solo letras minúsculas y guiones bajos.' });
        }

        // Obtener las columnas actuales de la tabla, excluyendo 'createdAt' y 'updatedAt'
        const existingFieldsSQL = `SELECT column_name 
                                    FROM information_schema.columns 
                                    WHERE table_name = '${lowerTableName}';`;
        const [existingFields] = await sequelize.query(existingFieldsSQL);
        const existingFieldNames = existingFields.map(field => field.column_name.toLowerCase());

        console.log(`Columnas existentes en '${lowerTableName}':`, existingFieldNames);

        // Filtrar las columnas de control que no se deben considerar
        const filteredExistingFieldNames = existingFieldNames.filter(field => !['id', 'createdat', 'updatedat'].includes(field));

        // Identificar campos a agregar o eliminar
        const newFieldNames = Object.keys(fields).map(field => field.toLowerCase());

        // Validar los nombres de los nuevos campos
        for (const field of newFieldNames) {
            if (!validateName(field)) {
                return res.status(400).json({ message: `El nombre del campo '${field}' debe contener solo letras minúsculas y guiones bajos.` });
            }
        }

        const fieldsToAdd = newFieldNames.filter(field => !filteredExistingFieldNames.includes(field));
        const fieldsToRemove = filteredExistingFieldNames.filter(field => !newFieldNames.includes(field));

        console.log(`Campos a agregar:`, fieldsToAdd);
        console.log(`Campos a eliminar:`, fieldsToRemove);

        // Agregar nuevas columnas
        for (const field of fieldsToAdd) {
            const type = fields[field].toUpperCase(); // Asegúrate que el tipo esté en mayúsculas
            const alterAddSQL = `ALTER TABLE ${lowerTableName} ADD COLUMN "${field}" ${type};`;
            console.log(`Ejecutando: ${alterAddSQL}`);
            await sequelize.query(alterAddSQL);
        }

        // Eliminar columnas que no se envían
        for (const field of fieldsToRemove) {
            const alterDropSQL = `ALTER TABLE ${lowerTableName} DROP COLUMN "${field}";`;
            console.log(`Ejecutando: ${alterDropSQL}`);
            await sequelize.query(alterDropSQL);
        }

        res.status(200).json({ message: `Tabla ${tableName} actualizada con éxito` });
    } catch (error) {
        console.error('Error al editar la tabla:', error);
        res.status(500).json({ error: 'Error al editar la tabla', details: error.message });
    }
};

exports.getTableStructure = async (req, res) => {
    const { tableName } = req.params;

    try {
        const lowerTableName = tableName.toLowerCase();

        // Verificar si la tabla existe
        const checkTableSQL = `SELECT EXISTS (
            SELECT 1 
            FROM information_schema.tables 
            WHERE table_name = '${lowerTableName}' 
            AND table_schema = 'public'
        ) AS table_exists;`;

        const [result] = await sequelize.query(checkTableSQL);
        if (result.table_exists) {
            return res.status(404).json({ message: `La tabla ${tableName} no existe.` });
        }

        // Obtener la estructura de la tabla
        const structureSQL = `
            SELECT column_name, data_type, is_nullable, character_maximum_length, 
                   numeric_precision, numeric_scale, 
                   (SELECT EXISTS (SELECT 1 FROM information_schema.table_constraints 
                                   WHERE table_name='${lowerTableName}' 
                                   AND constraint_type='UNIQUE' 
                                   AND column_name=columns.column_name)) AS is_unique
            FROM information_schema.columns AS columns
            WHERE table_name = '${lowerTableName}' 
            AND table_schema = 'public';
        `;
        const [columns] = await sequelize.query(structureSQL);
        // Mapear la estructura a un formato JSON
        const structure = columns.map(column => ({
            column_name: column.column_name,
            data_type: column.data_type,
            is_nullable: column.is_nullable === 'YES',
            character_maximum_length: column.character_maximum_length,
            numeric_precision: column.numeric_precision,
            numeric_scale: column.numeric_scale,
            is_unique: column.is_unique || false,
        }));

        res.json(structure);
    } catch (error) {
        console.error('Error al obtener la estructura de la tabla:', error);
        res.status(500).json({ error: 'Error al obtener la estructura de la tabla', details: error.message });
    }
};


