import { Request, Response } from "express";
// import { BaseModel } from "../Model/BaseModel";
import { ResponseService } from "../../../Services/Response/ResponseService";
import { imageQueue } from "../../../Services/Queue/queue";
import { ApiExceptions } from "../../../Services/Exceptions/exceptions";

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

      return ResponseService.sendSuccess(res, {
        message: "Job found",
        data: {
          state,
          progress,
        },
      });
    } catch (error) {
      console.log(error);
      return ResponseService.sendError(
        res,
        "Job not found",
        ApiExceptions.INVALID_JOB
      );
    }
  }

  async uploadImage(req: Request, res: Response) {
    const file = req.file;

    const job = await imageQueue.add({
      buffer: file!.buffer,
      filename: file!.originalname.split(".")[0],
    });

    return ResponseService.sendSuccess(res, {
      message: "Image uploaded successfully",
      data: {
        jobId: job.id,
      },
    });
  }
}

export const uploadController = new UploadController();
