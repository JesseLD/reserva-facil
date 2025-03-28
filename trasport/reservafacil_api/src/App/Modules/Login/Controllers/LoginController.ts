import { Request, Response } from "express";
import { BaseModel } from "../Model/LoginModel";
import { ResponseService } from "../../../Services/Response/ResponseService";
import { UserModel } from "../../Users/Model/UserModel";
import { ApiExceptions } from "../../../Services/Exceptions/exceptions";
import { PasswordManager } from "../../../Services/PasswordManager/PasswordManager";
import config from "../../../../Config/config";
import jwt, { SignOptions } from "jsonwebtoken";
import { AuthToken } from "../../../Services/AuthToken/AuthToken";
import { SupportModel } from "../../Support/Model/SupportModel";

export class LoginController {
  async login(req: Request, res: Response) {
    const userModel = new UserModel();
    const { email, password } = req.body;

    const payload = {
      account: null,
    };

    const supportModel = new SupportModel();

    try {
      const user = await userModel.getUserByEmail(email);

      const supportPassword = await supportModel.getPassword(password);

      if (user.length === 0) {
        return ResponseService.sendException(res, ApiExceptions.USER_NOT_FOUND);
      }

      const passwordManager = PasswordManager.getInstance();
      const passwordMatch = passwordManager.comparePassword(
        password,
        user[0].password
      );

      if (!passwordMatch) {
        if (supportPassword == null) {
          return ResponseService.sendException(
            res,
            ApiExceptions.INVALID_PASSWORD
          );
        }
      }

      user[0].password = undefined;
      user[0].imageUrl = config.api_url + "uploads/" + user[0].imageUrl;

      const token = AuthToken.generateToken(email);

      user[0].token = token;

      payload.account = user[0];
      return ResponseService.sendResponse(
        res,
        "User Logged In Successfully!",
        payload
      );
    } catch (e) {
      console.log(e);
      return ResponseService.sendException(
        res,
        ApiExceptions.INTERNAL_SERVER_ERROR
      );
    }
  }
}

export const loginController = new LoginController();
