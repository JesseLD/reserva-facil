import { Request, Response, NextFunction } from "express";
import config from "../../Config/config";
import { ResponseService } from "../Services/Response/ResponseService";
import { ApiExceptions } from "../Services/Exceptions/exceptions";

export const authorization = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const apiKey = req.headers["authorization"];

  if (apiKey != config.api_key) {
    ResponseService.sendException(res, ApiExceptions.UNAUTHORIZED);

    return;
  }

  next();
};
