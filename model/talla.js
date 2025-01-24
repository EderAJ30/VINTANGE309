import { Sequelize } from "sequelize";
import db from "../config/db.js";

export const Talla = db.define(
  "tallas",
  {
    id_talla: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    talla: {
      type: Sequelize.STRING(10),
    },
  },
  {
    timestamps: false,
    freezeTableName: true,
  }
);

export default Talla;
