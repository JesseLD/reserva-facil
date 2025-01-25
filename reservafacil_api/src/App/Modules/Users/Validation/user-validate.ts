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
  const items = ["email"];

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

export const validatePostUserId = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const { id } = req.body;

  if (!id) {
    return ResponseService.sendError(
      res,
      `Missing required items: id`,
      ApiExceptions.BAD_REQUEST
    );
  }
  next();
};
export const validateUploadUserId = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const id = req.params.id;

  // console.log(req.;)

  if (!id) {
    return ResponseService.sendError(
      res,
      `Missing required items: id`,
      ApiExceptions.BAD_REQUEST
    );
  }
  next();
};
export const validateRemoveImage = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const items = ["userId", "filename"];

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
export const validateEmail = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const items = ["email",];

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
export const ValidateUpdateUser = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const items = ["id","name","birthDate","phone"];

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
export const ValidateUpdatePass = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const items = ["email","password"];

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

export const validateDeleteUser = (
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

