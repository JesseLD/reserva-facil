import { Request, Response } from "express";
import { BaseModelModel } from "../Model/BaseModelModel";
import { ResponseService } from "../../../Services/Response/ResponseService";
export class BaseModuleController {
  
  async getAny(req: Request, res: Response) {
    const baseModel = new BaseModelModel();
    const any = await baseModel.getAny();

    return ResponseService.sendResponse(res, "Any Fetch Success!", any);
  }
}

export const baseModuleController = new BaseModuleController();
