import { Request, Response, NextFunction } from "express";
import { ResponseService } from "../../../Services/Response/ResponseService";
import { ApiExceptions } from "../../../Services/Exceptions/exceptions";

export const validateCreateUser = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const items = ["name", "email", "password", "cpfCnpj"];

  const missingItems = items.filter((item) => !req.body[item]);

  if (missingItems.length) {
    return ResponseService.sendError(
      res,
      `Missing required items: ${missingItems.join(", ")}`,
      ApiExceptions.BAD_REQUEST
    );
  }
  next();
};
export const validateRecoverPassword = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const items = ["email" , "code", "name"];

  const missingItems = items.filter((item) => !req.body[item]);

  if (missingItems.length) {
    return ResponseService.sendError(
      res,
      `Missing required items: ${missingItems.join(", ")}`,
      ApiExceptions.BAD_REQUEST
    );
  }
  next();
};

export const validateGetUserById = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const id = req.params.id;



  if (!id) {
    return ResponseService.sendError(
      res,
      `Missing required items: id`,
      ApiExceptions.BAD_REQUEST
    );
  }
  next();
};
