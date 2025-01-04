import dotenv from "dotenv";

dotenv.config();

const config = {
  port: process.env.PORT || 3000,
  env: process.env.NODE_ENV || "development",
  database : {
    host: process.env.DB_HOST || "localhost",
    user: process.env.DB_USER  || "root",
    password: process.env.DB_PASSWORD || "",
    database: process.env.DB_NAME || "test",
    port: process.env.DB_PORT || 5432
  }
}

export default config;