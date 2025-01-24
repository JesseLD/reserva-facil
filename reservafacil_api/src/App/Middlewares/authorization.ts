import { Request, Response, NextFunction } from "express";
import config from "../../Config/config";
import { ResponseService } from "../Services/Response/ResponseService";
import { ApiExceptions } from "../Services/Exceptions/exceptions";

export const authorization = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const apiKey = req.headers["authorization"] || req.headers["Authorization"];

  if (apiKey != config.api_key) {
    console.log(apiKey);
    ResponseService.sendException(res, ApiExceptions.UNAUTHORIZED);

    //  res.sendStatus(404);
    return;
  }

  next();
};
