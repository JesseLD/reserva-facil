import { server } from "./Config/express";
import config from "./Config/config";
import { AppDataSource } from "./App/Database/database";

server.listen(config.port, async () => {
  AppDataSource.initialize();
  console.log(`Server is running on http://localhost:${config.port}`);
});
