import { Request, Response } from "express";
import { LocalizationModel } from "../Model/LocalizationModel";
import { ResponseService } from "../../../Services/Response/ResponseService";
import { ApiExceptions } from "../../../Services/Exceptions/exceptions";
export class LocalizationController {
  async getAny(req: Request, res: Response) {
    const localization = new LocalizationModel();
    const any = await localization.getAny();

    return ResponseService.sendResponse(res, "Any Fetch Success!", any);
  }

  async getCepData(req: Request, res: Response) {
    const { cep } = req.params;

    const url = `https://viacep.com.br/ws/${cep}/json/`;

    const response = await fetch(url);

    if (response.status !== 200) {
      return ResponseService.sendException(res, ApiExceptions.CEP_NOT_FOUND);
    }
    const data = await response.json();
    return ResponseService.sendResponse(res, "Any Fetch Success!", data);
  }
  async getStates(req: Request, res: Response) {
 

    const localizationModel = new LocalizationModel();

    const data = await localizationModel.getStates();

    return ResponseService.sendResponse(res, "Any Fetch Success!", data);
  }
}

export const localizationController = new LocalizationController();
