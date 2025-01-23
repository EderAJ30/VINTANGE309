import express from "express";
import { crudPedidosRender } from "../controllers/admin/crudPedidosController.js";
import { crudProductosRender } from "../controllers/admin/crudProductosController.js";
import { crudUsuariosRender } from "../controllers/admin/crudUsuariosController.js";
import { estadoRender } from "../controllers/admin/estadoController.js";
import { loginRender } from "../controllers/admin/loginAdminController.js";

const router_admin = express.Router();

//http://localhost:2800/admin/loginAdmin                     para entrar al login de admin
router_admin.get("/loginAdmin", loginRender);

//entrada principal despuesa del login
router_admin.get("/estadoCuenta", estadoRender);

//rendeeer cruds
router_admin.get("/crudUsuarios", crudUsuariosRender);
router_admin.get("/crudProductos", crudProductosRender);
router_admin.get("/crudPedidos", crudPedidosRender);

export default router_admin;
