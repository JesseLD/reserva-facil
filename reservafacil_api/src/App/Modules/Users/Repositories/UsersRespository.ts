import { CreateUserDTO } from "../Dtos/CreateUserDTO";
import { IUsersRepository } from "./IUsersRepository";
import { Repository } from "typeorm";

export class UserRepository {
  

  // async findByEmail(email: string): Promise<Users | null> {
  //   return this.ormRepository.findOne({ where: { email } });
  // }
  // async create(data: CreateUserDTO): Promise<Users> {
  //   const user = this.ormRepository.create(data);
  //   await this.ormRepository.save(user);
  //   return user;
  // }
}
