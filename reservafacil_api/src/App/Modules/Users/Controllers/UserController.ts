import { Request, Response } from "express";
import { UserModel } from "../Model/UserModel";
import { ResponseService } from "../../../Services/Response/ResponseService";
import { User } from "../Entities/User";
import { ApiExceptions } from "../../../Services/Exceptions/exceptions";
import { mailService } from "../../../Services/Mail/MailService";
import { CodeGen } from "../../../Services/CodeGen/CodeGen";
import { UploadService } from "../../../Services/Upload/UploadService";
import config from "../../../../Config/config";
import { UpdateUser } from "../Entities/UpdateUser";
// import { PasswordManager } from "../../../Services/PasswordManager/PasswordManager";
export class UserController {
  // async getUsers(req: Request, res: Response) {
  //   const users = await this.userModel.getUsers();

  //   return ResponseService.sendResponse(res, "Users Fetch Success!", users);
  // }

  async getUserById(req: Request, res: Response) {
    const userModel = new UserModel();
    const { id } = req.params;

    try {
      const user = await userModel.getUserById(parseInt(id));
      return ResponseService.sendResponse(res, "User Fetch Success!", user);
    } catch (e) {
      return ResponseService.sendException(
        res,
        ApiExceptions.INTERNAL_SERVER_ERROR
      );
    }
  }

  async createUser(req: Request, res: Response) {
    const userModel = new UserModel();

    const { name, email, password, cpfCnpj } = req.body;

    const user = new User(name, email, password, cpfCnpj);

    try {
      await userModel.createUser(user);

      const code = CodeGen.generateCode();

      await mailService.sendActivateAccountMail(
        email,
        code,
        name,
        "Verifique o seu email - Reserva Fácil"
      );

      return ResponseService.sendResponse(res, "User Created Successfully!");
    } catch (e: any) {
      // console.log(e);
      if (e.message === ApiExceptions.USER_ALREADY_EXISTS.exception) {
        return ResponseService.sendException(
          res,
          ApiExceptions.USER_ALREADY_EXISTS
        );
      }
      return ResponseService.sendException(
        res,
        ApiExceptions.INTERNAL_SERVER_ERROR
      );
    }
  }

  async sendMail(req: Request, res: Response) {
    // const userModel = new UserModel();

    const { email, name, code } = req.body;

    try {
      // await mailService.sendMail();
      await mailService.sendActivateAccountMail(
        email,
        code,
        name,
        "Verifique o seu email - Reserva Fácil"
      );
      // await mailService.sendPasswordVerifyMail(
      //   email,
      //   code,
      //   name,
      //   "Recuperação de senha",
      // )
      return ResponseService.sendResponse(res, "Email Sent Successfully!");
    } catch (e: any) {
      console.log(e);
      return ResponseService.sendException(
        res,
        ApiExceptions.INTERNAL_SERVER_ERROR
      );
    }
  }

  async refresh(req: Request, res: Response) {
    const { email } = req.body;

    const userModel = new UserModel();

    const payload = {
      account: null,
    };

    try {
      const user = await userModel.getUserByEmail(email);

      if (user.length === 0) {
        return ResponseService.sendException(res, ApiExceptions.USER_NOT_FOUND);
      }

      user[0].password = undefined;
      user[0].imageUrl = config.api_url + "uploads/" + user[0].imageUrl;

      payload.account = user[0];
      return ResponseService.sendResponse(
        res,
        "User Refreshed Successfully!",
        payload
      );
    } catch (e: any) {
      console.log(e);
      return ResponseService.sendException(
        res,
        ApiExceptions.INTERNAL_SERVER_ERROR
      );
    }
  }

  async updateProfileImage(req: Request, res: Response) {
    const { id } = req.params;
    const image = req.file;

    const userModel = new UserModel();
    if (!image) {
      return ResponseService.sendException(res, ApiExceptions.INVALID_IMAGE);
    }

    try {
      const processedFilename = await UploadService.processImage(image);

      await userModel.updateUserImage(parseInt(id), processedFilename);

      // Retornando a resposta de sucesso
      return ResponseService.sendSuccess(res, {
        message: "Image uploaded and processed successfully.",
        data: {
          filename: processedFilename,
        },
      });
    } catch (error: any) {
      console.error("Error processing image:", error);

      return ResponseService.sendError(
        res,
        `Error processing image: ${error.message}`,
        ApiExceptions.INVALID_IMAGE
      );
    }
  }

  async removeUserImage(req: Request, res: Response) {
    const { userId, filename } = req.body;

    const userModel = new UserModel();

    try {
      await userModel.removeUserImage(parseInt(userId));

      await UploadService.removeImageFromUploadsFolder(filename);

      return ResponseService.sendResponse(res, "Image removed successfully!");
    } catch (e) {
      return ResponseService.sendException(
        res,
        ApiExceptions.INTERNAL_SERVER_ERROR
      );
    }
  }

  async updateUser(req: Request, res: Response) {
    const userModel = new UserModel();
    const { id, name, birthDate, phone } = req.body;

    const user = new UpdateUser(id, name, birthDate, phone);

    try {
      await userModel.updateUser(user);
      return ResponseService.sendResponse(res, "User Updated Successfully!");
    } catch (e: any) {
      console.log(e);
      return ResponseService.sendException(
        res,
        ApiExceptions.INTERNAL_SERVER_ERROR
      );
    }
  }

  async updatePassword(req: Request, res: Response) {
    const userModel = new UserModel();
    const { email, password } = req.body;

    try {
      await userModel.updatePassword(email, password);
      return ResponseService.sendResponse(
        res,
        "Password Updated Successfully!"
      );
    } catch (e: any) {
      console.log(e);
      return ResponseService.sendException(
        res,
        ApiExceptions.INTERNAL_SERVER_ERROR
      );
    }
  }

  async getRecoverPasswordCode(req: Request, res: Response) {

    const { email } = req.body;

    const userModel = new UserModel();

    try {
      const user = await userModel.getUserByEmail(email);

      if (user.length === 0) {
        return ResponseService.sendException(res, ApiExceptions.USER_NOT_FOUND);
      }

      const code = CodeGen.generateCode();

      await mailService.sendPasswordVerifyMail(
        email,
        code,
        user[0].name,
        "Recuperação de senha"
      );

      return ResponseService.sendResponse(res, "Code Sent Successfully!", {
        code,
      });
    } catch (e: any) {
      console.log(e);
      return ResponseService.sendException(
        res,
        ApiExceptions.INTERNAL_SERVER_ERROR
      );
    }
  }

  async deleteUser(req: Request, res: Response) {
    const userModel = new UserModel();
    const { id } = req.params;

    try {
      await userModel.deleteUser(parseInt(id));
      return ResponseService.sendResponse(res, "User Deleted Successfully!");
    } catch (e: any) {
      console.log(e);
      return ResponseService.sendException(
        res,
        ApiExceptions.INTERNAL_SERVER_ERROR
      );
    }
  }
}

export const userController = new UserController();
