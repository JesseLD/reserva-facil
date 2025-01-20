import { Request, Response } from "express";
import { UserModel } from "../Model/UserModel";
import { ResponseService } from "../../../Services/Response/ResponseService";
import { User } from "../Entities/User";
import { ApiExceptions } from "../../../Services/Exceptions/exceptions";
import { mailService } from "../../../Services/Mail/MailService";
// import { PasswordManager } from "../../../Services/PasswordManager/PasswordManager";
export class UserController {

  // async getUsers(req: Request, res: Response) {
  //   const users = await this.userModel.getUsers();

  //   return ResponseService.sendResponse(res, "Users Fetch Success!", users);
  // }




  async createUser(req: Request, res: Response)  {

    const userModel = new UserModel();

    const { name, email, password, cpfCnpj } = req.body;

    const user = new User(
      name,
      email,
      password,
      cpfCnpj
    );


    try {
      await userModel.createUser(user);
      return ResponseService.sendResponse(res, "User Created Successfully!");
    }catch(e:any) {
      console.log(e);
      if(e.message === ApiExceptions.USER_ALREADY_EXISTS.exception) {
        return ResponseService.sendException(res, ApiExceptions.USER_ALREADY_EXISTS);
      } 
      return ResponseService.sendException(res, ApiExceptions.INTERNAL_SERVER_ERROR);
    }

  }


  async sendMail(req: Request, res: Response)  {
    
    // const userModel = new UserModel();

    const { email,name,code } = req.body;

    try {
      // await mailService.sendMail();
      await mailService.sendActivateAccountMail(
        email,
        code,
        name,
        "Verifique o seu email - Reserva Fácil",
      )
      // await mailService.sendPasswordVerifyMail(
      //   email,
      //   code,
      //   name,
      //   "Recuperação de senha",
      // )
      return ResponseService.sendResponse(res, "Email Sent Successfully!");
    }catch(e:any) {
      console.log(e);
      return ResponseService.sendException(res, ApiExceptions.INTERNAL_SERVER_ERROR);
    }
  }
}

export const userController = new UserController();
