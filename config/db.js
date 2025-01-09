// Conexion a Base de Datos 
import { Sequelize } from "sequelize";
import dotenv from "dotenv";
// Invocamos a dotenv
// Configurar variables de entorno
dotenv.config({path:".env"})
const db = new Sequelize(process.env.DB_DATABASE, process.env.DB_USER, process.env.DB_PASSWORD, {
    dialect:process.env.DB_DIALEC ,
    dialectOptions:{
        host: process.env.DB_HOST,
        port: process.env.DB_PORT,
        timestamps:false,
        underscore:false,
        pool:{
            max:5, 
            min:0,
            aquire:30000,
            idle:10000
        },

        operatorAlies:false
    }
});

export default db;