import express from "express";
import { carritoRender } from "../controllers/compras/carritoController.js";
import { detallesPedidoRender } from "../controllers/compras/detallesPedidoController.js";
import { pagoRender } from "../controllers/compras/pagoController.js";

const router_compras = express.Router();

router_compras.get("/carrito", carritoRender);

router_compras.get("/detallesPedido", detallesPedidoRender)
router_compras.get("/pagar", pagoRender)

export default router_compras;
