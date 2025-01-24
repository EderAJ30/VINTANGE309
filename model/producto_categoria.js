import { Sequelize } from "sequelize";
import db from "../config/db.js";
import Producto from "./producto.js";
import Categoria from "./categoria.js";

export const ProductoCategoria = db.define(
  "productos_categorias",
  {
    id_producto: {
      type: Sequelize.INTEGER,
      references: {
        model: Producto,
        key: "id_producto",
      },
      allowNull: false,
    },
    id_categoria: {
      type: Sequelize.INTEGER,
      references: {
        model: Categoria,
        key: "id_categoria",
      },
      allowNull: false,
    },
  },
  {
    timestamps: false,
    freezeTableName: true,
  }
);

// Relaciones
Producto.belongsToMany(Categoria, {
  through: ProductoCategoria,
  foreignKey: "id_producto",
});
Categoria.belongsToMany(Producto, {
  through: ProductoCategoria,
  foreignKey: "id_categoria",
});

export default ProductoCategoria;
