import express, {
  ErrorRequestHandler,
  Request,
  Response,
  NextFunction,
} from "express";
import "express-async-errors";
import cors from "cors";

export const app = express();

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

app.use(errorHandler);
