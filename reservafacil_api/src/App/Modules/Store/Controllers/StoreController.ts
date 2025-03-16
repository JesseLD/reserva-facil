import { Request, Response } from "express";
import { StoreModel } from "../Model/StoreModel";
import { ResponseService } from "../../../Services/Response/ResponseService";
import { ApiExceptions } from "../../../Services/Exceptions/exceptions";
export class StoreController {
  
  async getCategories(req: Request, res: Response) {
    const store = new StoreModel();
    const categories = await store.getCategories();

    return ResponseService.sendResponse(res, "Categries Fetch Success!", categories);
  }

  async getPhone(req: Request, res: Response) {
    const store = new StoreModel();
    const phone = await store.getPhone(req.params.phone);

    if(phone.length === 0) {
      return ResponseService.sendException(res, ApiExceptions.USER_NOT_FOUND);
    }

    return ResponseService.sendResponse(res, "Phone Fetch Success!", phone);
  }

  async getEmail(req: Request, res: Response) {
    const store = new StoreModel();
    const email = await store.getEmail(req.params.email);

    if(email.length === 0) {
      return ResponseService.sendException(res, ApiExceptions.USER_NOT_FOUND);
    }

    return ResponseService.sendResponse(res, "Email Fetch Success!", email);
  }

  async getCpfCnpj(req: Request, res: Response) {
    const store = new StoreModel();
    const cpfcnpj = await store.getCpfCnpj(req.params.cpfcnpj);

    if(cpfcnpj.length === 0) {
      return ResponseService.sendException(res, ApiExceptions.USER_NOT_FOUND);
    }

    return ResponseService.sendResponse(res, "CpfCnpj Fetch Success!", cpfcnpj);
  }


  async create(req: Request, res: Response) {
    const store = new StoreModel();
    const data = req.body;

    const storeData = await store.create(data);

    return ResponseService.sendResponse(res, "Store Created!", storeData);
  }
}

export const storeController = new StoreController();
