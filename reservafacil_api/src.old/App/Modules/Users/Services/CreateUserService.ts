import { ApiExceptions } from "../../../Services/Exceptions/exceptions";
import { PasswordManager } from "../../../Services/PasswordManager/PasswordManager";
import { ResponseService } from "../../../Services/Response/ResponseService";
import { CreateUserDTO } from "../Dtos/CreateUserDTO";
import { IUsersRepository } from "../repositories/IUsersRepository";

export class CreateUserService {
  constructor(private usersRepository: IUsersRepository) {}

  async execute(data: CreateUserDTO): Promise<void> {
    const existingUser = await this.usersRepository.findByEmail(data.email);

    if (existingUser) {
      throw Error(ApiExceptions.USER_ALREADY_EXISTS.exception);
    }

    const hashedPassword = await PasswordManager.getInstance().generatePassword(data.password);

    await this.usersRepository.create({
      ...data,
      password: hashedPassword,
    });
  }
}
