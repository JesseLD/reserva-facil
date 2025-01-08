import dotenv from "dotenv";

dotenv.config();

const config = {
  port: process.env.PORT || 3000,
  env: process.env.NODE_ENV || "development",
  api_key: process.env.API_KEY || "123456",
  api_secret: process.env.API_SECRET || "123456",
  password: {
    salt: process.env.PASSWORD_SALT || "123",
    secret: process.env.PASSWORD_SECRET || "123"
  },
  database : {
    host: process.env.DB_HOST || "localhost",
    user: process.env.DB_USER  || "root",
    password: process.env.DB_PASSWORD || "",
    database: process.env.DB_NAME || "test",
    port: process.env.DB_PORT || 5432
  }
}

export default config;