import express from "express";
import { productosRender } from "../controllers/productos/productosController.js";

const router_producto = express.Router();

router_producto.get("/categorias", productosRender);

export default router_producto;
