import express, {
  ErrorRequestHandler,
  Request,
  Response,
  NextFunction,
} from "express";
import "express-async-errors";
import cors from "cors";
import http from "http";

import { indexRouter } from "../App/Routes/index.routes";
import { handleUpgrade } from "../App/Services/WebSocket/websocket";
import { readQueue } from "../App/Services/Workers/simpleWorker";

export const app = express();

// We need to create a server to use with websockets
export const server = http.createServer(app);

server.on("upgrade", handleUpgrade);

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const errorHandler: ErrorRequestHandler = (
  err: Error,
  req: Request,
  res: Response,
  next: NextFunction
) => {
  if (err) {
    console.error(err.stack);
    res.status(500).send("Something went wrong!");
    return;
  }
  next();
};

app.use(indexRouter);

app.use(errorHandler);

readQueue("Reservas")
readQueue("Lembretes")
