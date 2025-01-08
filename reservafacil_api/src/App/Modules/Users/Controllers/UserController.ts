import { plainToInstance } from "class-transformer";
import { Request, Response } from "express";
import { CreateUserDTO } from "../Dtos/CreateUserDTO";
export class UserController {

  async create(req: Request, res: Response): Promise<Response> { 

    const userDto = plainToInstance(CreateUserDTO, req.body);


    return [];
  }
}