// import = requequeeridos
import express from "express";
import inicio from "./routes/inicio_router.js";
import router_productos from "./routes/productos_router.js";

//import session from "express-session";

// Registro Usuario

import db from "./config/db.js";
//import cookieParser from "cookie-parser";
import dotenv from "dotenv";
//import router_Verificar from "./routes/router_Verificar.js";
//import { isAuthenticated } from "./middleware/middleware.js";

// CONFIGURACIONES PAGINA

// Crear la aplicacion 
const app = express();

// Procesar datos enviados desde forms
app.use(express.urlencoded({ extended: true }));

// Conexión a la base de datos
try {
    await db.authenticate();
    db.sync();
    console.log("Conexion exitosa a la base de datos");
} catch (error) {
    console.log("Error de conexión a la base de datos:", error);
    process.exit(1);  // Detiene el servidor si no se puede conectar a la base de datos
}

// Seteamos las variables de entorno
dotenv.config({ path: ".env" });

// Seteamos las cookies 
//app.use(cookieParser());

app.set("view engine", "pug");
app.set("views", "./views");
app.use(express.static("public"));

// Variables de 
/*
app.use(session({
    secret: "secret",   
    resave: true,
    saveUninitialized: true
}));
*/

// Llamar a los routers
// routing -> Ruta por default
//app.use("/login", router_Login);
//app.use("/register", router_Registro);
//app.use("/logout", router_Logout);
//app.use("/verificar", router_Verificar);

// Middleware para verificar la sesión
/*app.use(function(req, res, next) {
    res.locals.loggedin = req.session.loggedin;
    next();  // Usamos 'next()' para continuar el flujo
}); */


//app.use("/admin", router_crud);

//rouuters quue usaremos
app.use("/", inicio);
app.use("/layout", router_productos);
app.use("/image", express.static("public/image"));

// Definiendo el puerto -> Puerto de comunicación
const port = 2800;
app.listen(port, () => {
    console.log(`Esperando peticiones en el puerto ${port}`);
});        