import { Sequelize } from "sequelize";
import db from "../config/db.js";

export const Categoria = db.define(
  "categorias",
  {
    id_categoria: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    nombre_categoria: {
      type: Sequelize.STRING(50),
      allowNull: false,
    },
  },
  {
    timestamps: false, // No queremos campos de tiempo automáticos
    freezeTableName: true, // Mantener el nombre exacto de la tabla
  }
);

export default Categoria;
