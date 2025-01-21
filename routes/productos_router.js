import express from "express";
import {playeras} from "../controllers/playerasController.js";

const router_productos = express.Router();

router_productos.get("/playera", playeras);

export default router_productos