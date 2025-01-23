import express from "express";
import { contactoRender } from "../controllers/footer/contactoController.js";

const router_footer = express.Router();

router_footer.get("/contacto", contactoRender);

export default router_footer;