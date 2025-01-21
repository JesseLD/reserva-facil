import { Request, Response, NextFunction } from "express";
import { ResponseService } from "../../../Services/Response/ResponseService";
import { ApiExceptions } from "../../../Services/Exceptions/exceptions";
import multer from "multer";

export const validateUploadImage = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  // const items = ["name", "email", "password"];

  const file = req.file;

  // const missingItems = items.filter((item) => !req.body[item]);

  if (!file) {
    return ResponseService.sendError(
      res,
      `Please upload an image`,
      ApiExceptions.INVALID_IMAGE
    );
  }
  next();
};
export const validateJobId = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  // const items = ["name", "email", "password"];

  const { id } = req.params;

  // const missingItems = items.filter((item) => !req.body[item]);

  if (!id) {
    return ResponseService.sendError(
      res,
      `Please provide a job id`,
      ApiExceptions.INVALID_JOB
    );
  }
  next();
};
