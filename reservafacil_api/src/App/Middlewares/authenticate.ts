import { Request, Response, NextFunction } from "express";
import config from "../../Config/config";
import { ResponseService } from "../Services/Response/ResponseService";
import { ApiExceptions } from "../Services/Exceptions/exceptions";
import { AuthToken } from "../Services/AuthToken/AuthToken";

export const authenticate = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const token = req.headers["X-TOKEN"] || req.headers["x-token"];
  if (!token) {
    return ResponseService.sendException(res, ApiExceptions.INVALID_TOKEN);
  }

  // This is a temporary solution for Postman testing
  if (token == "POSTMAN") {
    return next();
  }

  if (config.mobile.skip_auth && token == config.mobile.auth_secret) {
    return next();
  }

  const validate = AuthToken.verifyToken(token as string);

  if (!validate) {
    return ResponseService.sendException(res, ApiExceptions.INVALID_TOKEN);
  }

  next();
};
