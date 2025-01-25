import { Request, Response } from "express";
// import { BaseModel } from "../Model/BaseModel";
import { ResponseService } from "../../../Services/Response/ResponseService";
import { imageQueue } from "../../../Services/Queue/queue";
import { ApiExceptions } from "../../../Services/Exceptions/exceptions";
import sharp from "sharp";
import path from "path";
import fs from "fs";
import { UploadService } from "../../../Services/Upload/UploadService";

export class UploadController {
  async getUploadStatus(req: Request, res: Response) {
    const { id } = req.params;

    try {
      const job = await imageQueue.getJob(id);

      if (!job) {
        return ResponseService.sendError(
          res,
          "Job not found",
          ApiExceptions.INVALID_JOB
        );
      }

      const state = await job.getState();
      const progress = job.progress;

      // Adicionando mais detalhes no log do estado do job
      console.log("Job state:", state);
      console.log("Job progress:", progress);

      if (state === "failed") {
        const failedReason = await job.failedReason;
        console.log("Job failed reason:", failedReason);
        return ResponseService.sendError(
          res,
          `Job failed: ${failedReason}`,
          ApiExceptions.INVALID_JOB
        );
      }

      return ResponseService.sendSuccess(res, {
        message: "Job found",
        data: {
          state,
          progress,
        },
      });
    } catch (error) {
      console.log("Error retrieving job status:", error);
      return ResponseService.sendError(
        res,
        "Job not found",
        ApiExceptions.INVALID_JOB
      );
    }
  }

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
    } catch (error:any) {
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
