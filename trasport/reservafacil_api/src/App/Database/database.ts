// import { DataSource } from "typeorm";
import { DataSource } from "typeorm";
import config from "../../Config/config";
import { connect } from "http2";
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
  extra: {
    connectionLimit: 10,
    connectTimeout: 60000,
  }
});

export const databaseConnect = async () => {
  try {
    await AppDataSource.initialize()
    .then(() => {
      console.log("Connection has been established successfully.");
    })
    .catch(async (error) => {
      console.error("Unable to connect to the database:", error);
      console.log("Retrying in 5 seconds...");
      setTimeout(databaseConnect, 5000); // Tenta reconectar após 5s
    });
  ;
    console.log("Connection has been established successfully.");
  } catch (error) {
    console.error("Unable to connect to the database:", error);
    process.exit(1);
  }
};
