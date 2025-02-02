import { Request, Response } from "express";
// import { BaseModel } from "../Model/BaseModel";
import { ResponseService } from "../../../Services/Response/ResponseService";
import { ApiExceptions } from "../../../Services/Exceptions/exceptions";
import sharp from "sharp";
import path from "path";
import fs from "fs";
import { UploadService } from "../../../Services/Upload/UploadService";

export class UploadController {
  async uploadImage(req: Request, res: Response) {
    const file = req.file;

    if (!file) {
      return ResponseService.sendError(
        res,
        `Please upload an image`,
        ApiExceptions.INVALID_IMAGE
      );
    }

    try {
      const processedFilename = await UploadService.processImage(file);
      // Retornando a resposta de sucesso
      return ResponseService.sendSuccess(res, {
        message: "Image uploaded and processed successfully.",
        data: {
          filename: processedFilename,
        },
      });
    } catch (error: any) {
      console.error("Error processing image:", error);

      return ResponseService.sendError(
        res,
        `Error processing image: ${error.message}`,
        ApiExceptions.INVALID_IMAGE
      );
    }
  }
}

export const uploadController = new UploadController();
