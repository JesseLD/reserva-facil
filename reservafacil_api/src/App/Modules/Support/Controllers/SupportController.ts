import { Request, Response } from "express";
import { SupportModel } from "../Model/SupportModel";
import { ResponseService } from "../../../Services/Response/ResponseService";
export class SupportController {
  
  async generateSupportPassword(req: Request, res: Response) {

    const str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    const len = 8;
    const expiresDays = 1;
    const expiresAt = new Date();
    expiresAt.setDate(expiresAt.getDate() + expiresDays);
    let password = "";

    for (let i = 0; i < len; i++) {
      password += str.charAt(Math.floor(Math.random() * str.length));
    }
    const support = new SupportModel();

    await support.insertPassword({
      password,
      expiresAt: expiresAt.toISOString().slice(0, 19).replace("T", " "),
    });
    // const any = await support.getAny();

    return ResponseService.sendResponse(res, "Any Fetch Success!", { password, expiresAt });
  }

  async getSupportPassword(req: Request, res: Response) {
    const supportKey = req.params.supportKey;
    const support = new SupportModel();
    const key = await support.getPassword(supportKey);

    return ResponseService.sendResponse(res, "Support Key Fetch Success!", key);
  }
}

export const supportController = new SupportController();
