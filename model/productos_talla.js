import { Sequelize } from "sequelize";
import db from "../config/db.js";
import Producto from "./producto.js";
import Talla from "./talla.js";

export const ProductoTalla = db.define(
  "productos_tallas",
  {
    id_producto: {
      type: Sequelize.INTEGER,
      references: {
        model: Producto,
        key: "id_producto",
      },
      allowNull: false,
    },
    id_talla: {
      type: Sequelize.INTEGER,
      references: {
        model: Talla,
        key: "id_talla",
      },
      allowNull: false,
    },
    stock_talla: {
      type: Sequelize.INTEGER,
      allowNull: false,
    },
  },
  {
    timestamps: false,
    freezeTableName: true,
  }
);

// Relaciones
Producto.belongsToMany(Talla, {
  through: ProductoTalla,
  foreignKey: "id_producto",
});
Talla.belongsToMany(Producto, {
  through: ProductoTalla,
  foreignKey: "id_talla",
});

export default ProductoTalla;
