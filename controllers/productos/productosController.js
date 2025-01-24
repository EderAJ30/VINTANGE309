import { Op } from "sequelize";

const productosRender = async (req, res) => {
  res.render("productos/categorias");
};

export { productosRender };
