import { Request, Response } from "express";
import { Config } from "../Model/Config";
import { ResponseService } from "../../../Services/Response/ResponseService";
import config from "../../../../Config/config";
export class ConfigController {
  
  async getSettings(req: Request, res: Response) {

    const configModel = new Config();
    const data = await configModel.getConfig(config.update.track);

    return ResponseService.sendResponse(res, "Config Fetch Success!", data);
  }
}

export const configController = new ConfigController();
