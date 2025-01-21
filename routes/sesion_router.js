import express from "express";
import { loginRender } from "../controllers/sesion/loginController.js";

const router_sesion = express.Router();

router_sesion.get("/login", loginRender);

export default router_sesion;
