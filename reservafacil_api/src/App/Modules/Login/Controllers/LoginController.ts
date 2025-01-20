import { Request, Response } from "express";
import { BaseModel } from "../Model/LoginModel";
import { ResponseService } from "../../../Services/Response/ResponseService";
import { UserModel } from "../../Users/Model/UserModel";
import { ApiExceptions } from "../../../Services/Exceptions/exceptions";
import { PasswordManager } from "../../../Services/PasswordManager/PasswordManager";

export class LoginController {
  async login(req: Request, res: Response) {
    const userModel = new UserModel();
    const { email, password } = req.body;

    try {
      const user = await userModel.getUserByEmail(email);
      if (user.length === 0) {
        return ResponseService.sendException(res, ApiExceptions.USER_NOT_FOUND);
      }

      const passwordManager = PasswordManager.getInstance();
      const passwordMatch = passwordManager.comparePassword(
        password,
        user[0].password
      );

      if (!passwordMatch) {
        return ResponseService.sendException(
          res,
          ApiExceptions.INVALID_PASSWORD
        );
      }

      return ResponseService.sendResponse(
        res,
        "User Logged In Successfully!",
        user[0]
      );
    } catch (e) {
      return ResponseService.sendException(
        res,
        ApiExceptions.INTERNAL_SERVER_ERROR
      );
    }
  }
}

export const loginController = new LoginController();
