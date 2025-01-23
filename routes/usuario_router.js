import express from "express";
import { usuarioRender } from "../controllers/usuario/usuarioController.js";
import { historialComprasRender } from "../controllers/usuario/historialComprasController.js";
import { metodoEnvioRender } from "../controllers/usuario/metodoEnvioController.js";
import { metodoPagoRender } from "../controllers/usuario/metodoPagoController.js";

const router_usuario = express.Router();

router_usuario.get("/usuario", usuarioRender);

router_usuario.get("/metodoPago", metodoPagoRender);
router_usuario.get("/metodoEnvio", metodoEnvioRender);
router_usuario.get("/historialCompras", historialComprasRender);

export default router_usuario;

