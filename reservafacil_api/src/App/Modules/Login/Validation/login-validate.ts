import { Request, Response, NextFunction } from "express";
import { ResponseService } from "../../../Services/Response/ResponseService";
import { ApiExceptions } from "../../../Services/Exceptions/exceptions";

export const validateLogin = (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  const items = [ "email", "password"];

  const missingItems = items.filter((item) => !req.body[item]);

  if (missingItems.length) {
    return ResponseService.sendError(
      res,
      `Missing required items: ${missingItems.join(", ")}`,
      ApiExceptions.BAD_REQUEST,
    );
  }
  next();
};
