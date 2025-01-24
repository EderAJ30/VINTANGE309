import { Sequelize } from "sequelize";
import db from "../config/db.js";

export const Producto = db.define(
  "productos",
  {
    id_producto: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    nombre: {
      type: Sequelize.STRING(100),
      allowNull: false,
    },
    imagen: {
      type: Sequelize.STRING(255),
      allowNull: false,
    },
    descripcion: {
      type: Sequelize.TEXT,
      allowNull: true,
    },
    precio: {
      type: Sequelize.DECIMAL(10, 2),
      allowNull: false,
    },
    costo: {
      type: Sequelize.DECIMAL(10, 2),
      allowNull: false,
    },
    stock: {
      type: Sequelize.INTEGER,
      allowNull: false,
    },
    estado: {
      type: Sequelize.ENUM("Activo", "Inactivo"),
      allowNull: false,
    },
    id_marca: {
      type: Sequelize.INTEGER,
      allowNull: true,
    },
    id_categoria: {
      type: Sequelize.INTEGER,
      allowNull: true,
    },
    creado_en: {
      type: Sequelize.DATE,
      allowNull: false,
      defaultValue: Sequelize.NOW,
    },
    actualizado_en: {
      type: Sequelize.DATE,
      allowNull: false,
      defaultValue: Sequelize.NOW,
    },
  },
  {
    timestamps: false,
    freezeTableName: true,
  }
);

export default Producto;
