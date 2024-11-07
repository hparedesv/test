
export interface TableData {
    tableName: string;
    fields: {
        [key: string]: 'TEXT' | 'INTEGER' | 'FLOAT'; // Define los tipos posibles para los campos
    };
}
