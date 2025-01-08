import { app } from "./Config/express";
import config from "./Config/config";



app.listen(config.port, async () => {
  console.log(`Server is running on http://localhost:${config.port}`);
});