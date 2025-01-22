import { Request, Response, NextFunction } from "express";
import { ResponseService } from "../../../Services/Response/ResponseService";
import { ApiExceptions } from "../../../Services/Exceptions/exceptions";
import multer from "multer";


export const validateUploadImage = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const file = req.file; // A imagem enviada vai estar em req.file

  // if (!file) {
  //   return ResponseService.sendError(
  //     res,
  //     `Please upload an image`,
  //     ApiExceptions.INVALID_IMAGE
  //   );
  // }

  // Você pode adicionar outras validações para o tipo de arquivo, extensão, etc., aqui
  // Por exemplo, para garantir que a imagem seja um arquivo JPEG ou PNG
  // if (!]file.mimetype.startsWith("image/")) {
  //   return ResponseService.sendError(
  //     res,
  //     `Invalid file type`,
  //     ApiExceptions.INVALID_IMAGE
  //   );
  // }

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
