import { AppDataSource } from "../../../Database/database";
import { ApiExceptions } from "../../../Services/Exceptions/exceptions";
import { PasswordManager } from "../../../Services/PasswordManager/PasswordManager";
import { User } from "../Entities/User";

export class UserModel {
  async getUserById(id: number) {
    return await AppDataSource.query("SELECT * FROM Users WHERE id = ?", [id]);
  }

  async getUserByEmail(email: string) {
    return await AppDataSource.query("SELECT * FROM Users WHERE email = ?", [email]);
  }

  async getUsers() {
    return await AppDataSource.query("SELECT * FROM Users");
  }

  async createUser(user: User) {
    const passwordManager = PasswordManager.getInstance();
    const hashedPassword = passwordManager.hashPassword(user.password);


    const exists  = await AppDataSource.query("SELECT * FROM Users WHERE email = ? OR cpfCnpj = ?", [user.email, user.cpfCnpj]);

    if(exists.length > 0) {
      throw new Error(ApiExceptions.USER_ALREADY_EXISTS.exception);
    }

    const queryRunner = await AppDataSource.createQueryRunner();

    await queryRunner.startTransaction();

    try {
      await AppDataSource.query(
        "INSERT INTO Users ( name, email, password, cpfCnpj ) VALUES ( ?, ?, ?, ? )",
        [user.name, user.email, hashedPassword, user.cpfCnpj]
      );
      await queryRunner.commitTransaction();
    } catch (e) {
      await queryRunner.rollbackTransaction();
      throw e;
    } finally {
      await queryRunner.release();
    }
  }
}
