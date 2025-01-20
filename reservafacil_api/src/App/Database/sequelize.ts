// import { Sequelize } from "sequelize";
// import config from "../../Config/config";

// export const sequelize = new Sequelize({
//   database: config.database.database,
//   host: config.database.host,
//   port: Number.parseInt(config.database.port as string),
//   username: config.database.user,
//   password: config.database.password,
//   dialect: "postgres",
// });

// export const databaseConnect = async () => {
//   try {
//     await sequelize.authenticate();
//     console.log("Connection has been established successfully.");
//   } catch (error) {
//     console.error("Unable to connect to the database:", error);
//   }
// };
