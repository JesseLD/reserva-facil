import { Request, Response } from "express";
import { BaseModel } from "../Model/BaseModel";
import { ResponseService } from "../../../Services/Response/ResponseService";
export class BaseModuleController {
  
  async getAny(req: Request, res: Response) {
    const baseModel = new BaseModel();
    const any = await baseModel.getAny();

    return ResponseService.sendResponse(res, "Any Fetch Success!", any);
  }
}

export const baseModuleController = new BaseModuleController();
