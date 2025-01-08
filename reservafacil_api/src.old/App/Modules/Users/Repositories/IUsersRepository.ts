import { CreateUserDTO } from "../Dtos/CreateUserDTO";
import { Users } from "../Entities/Users";

export interface IUsersRepository {

  findByEmail(email: string): Promise< Users | null >;
  create(data: CreateUserDTO): Promise< Users >;
}