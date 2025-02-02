import dotenv from 'dotenv';
dotenv.config();

export const config = { 
  api_url: process.env.API_URL || 'http://localhost:3000/',
  api_key: process.env.API_KEY || '123456',

}