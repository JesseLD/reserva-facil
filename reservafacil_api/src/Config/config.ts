import dotenv from "dotenv";

dotenv.config();

const config = {
  port: process.env.PORT || 3000,
  env: process.env.NODE_ENV || "development",
  api_key: process.env.API_KEY || "123456",
  api_secret: process.env.API_SECRET || "123456",
  api_url: process.env.API_URL || "http://localhost:3000",
  mobile: {
    skip_auth: process.env.MOBILE_APP_SKIP_AUTH|| false,
    auth_secret: process.env.MOBILE_APP_AUTH_SECRET || "123",
  },
  jwt: {
    secret: process.env.JWT_SECRET || "123",
    expiresIn: process.env.JWT_EXPIRES_IN || "1d",
  },
  password: {
    salt: process.env.PASSWORD_SALT || "123",
    secret: process.env.PASSWORD_SECRET || "123",
  },
  database: {
    host: process.env.DB_HOST || "localhost",
    user: process.env.DB_USER || "root",
    password: process.env.DB_PASSWORD || "",
    database: process.env.DB_NAME || "test",
    port: process.env.DB_PORT || 5432,
  },
  mail: {
    host: process.env.MAIL_HOST || "",
    port: process.env.MAIL_PORT || 587,
    secure: process.env.MAIL_SECURE || false,
    useGmail: process.env.MAIL_USE_GMAIL || false,
    service: process.env.MAIL_SERVICE || "",
    user: process.env.MAIL_AUTH_USER || "",
    pass: process.env.MAIL_AUTH_PASS || "",
    mailFrom: process.env.MAIL_FROM || "",
    mailFromName: process.env.MAIL_FROM_NAME || "",
  },
  redis: {
    host: process.env.REDIS_HOST || "localhost",
    port: process.env.REDIS_PORT || 6379,
    password: process.env.REDIS_PASSWORD || "",
  },
};

export default config;
