import express from "express";
import { carritoRender } from "../controllers/carrito/carritoController.js";

const router_carrito = express.Router();

router_carrito.get("/carrito", carritoRender);

export default router_carrito;
