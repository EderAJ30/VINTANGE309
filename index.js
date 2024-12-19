import inicio from "./routes/inicio_router.js";
import express from "express";
import db from "./config/db.js";

const app = express();

//rendeerizar con pug o html
app.set("view engine", "pug");
app.set("views", "./views");

// carpeta publica para la vista 
app.use(express.static("public"));

//ruta por defecto y rutas del sistema
app.use("/", inicio)

//puerto dondee see abre el localhost
const port = 2800;
app.listen(port, () => {
    console.log("Esperando peticiones en");
});

// Conectando a la base de datos
try{
    await db.authenticate();
    db.sync();
    console.log("Conexion exitosa a la base de datos");
    
}catch(error){
    console.log(error); 
}