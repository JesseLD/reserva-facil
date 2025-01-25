// import { DataSource } from "typeorm";
import { DataSource } from "typeorm";
import config from "../../Config/config";
// import { Users } from "../Modules/Users/Entities/Users";

export const AppDataSource = new DataSource({
  type: "mysql",
  host: config.database.host,
  port: Number.parseInt(config.database.port as string),
  username: config.database.user,
  password: config.database.password,
  database: config.database.database,
  // entities: ["src/App/Modules/**/Entities/*.ts", "src/App/Entities/*.ts"],
  synchronize: false,
});

export const databaseConnect = async () => {
  try {
    await AppDataSource.initialize();
    console.log("Connection has been established successfully.");
  } catch (error) {
    console.error("Unable to connect to the database:", error);
    process.exit(1);
  }
};
