import { AppDataSource } from "../../../Database/database";
import { CreateUserDTO } from "../Dtos/CreateUserDTO";
import { Users } from "../Entities/Users";
import { IUsersRepository } from "./IUsersRepository";
import { Repository } from "typeorm";

export class UserRepository implements IUsersRepository {
  private ormRepository: Repository<Users>;

  constructor() {
    this.ormRepository = AppDataSource.getRepository(Users);
  }

  async findByEmail(email: string): Promise<Users | null> {
    return this.ormRepository.findOne({ where: { email } });
  }
  async create(data: CreateUserDTO): Promise<Users> {
    const user = this.ormRepository.create(data);
    await this.ormRepository.save(user);
    return user;
  }
}
