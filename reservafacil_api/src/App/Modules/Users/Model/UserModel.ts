import { AppDataSource } from "../../../Database/database";
import { ApiExceptions } from "../../../Services/Exceptions/exceptions";
import { PasswordManager } from "../../../Services/PasswordManager/PasswordManager";
import { UpdateUser } from "../Entities/UpdateUser";
import { User } from "../Entities/User";

export class UserModel {
  defaultImage = "default-avatar.jpeg";
  async getUserById(id: number) {
    return await AppDataSource.query("SELECT * FROM Users WHERE id = ?", [id]);
  }

  async getUserByEmail(email: string) {
    return await AppDataSource.query("SELECT * FROM Users WHERE email = ?", [
      email,
    ]);
  }

  async getUsers() {
    return await AppDataSource.query("SELECT * FROM Users");
  }

  async createUser(user: User) {
    const passwordManager = PasswordManager.getInstance();
    const hashedPassword = passwordManager.hashPassword(user.password);

    const exists = await AppDataSource.query(
      "SELECT * FROM Users WHERE email = ? OR cpfCnpj = ?",
      [user.email, user.cpfCnpj]
    );

    if (exists.length > 0) {
      throw new Error(ApiExceptions.USER_ALREADY_EXISTS.exception);
    }

    const queryRunner = await AppDataSource.createQueryRunner();

    await queryRunner.startTransaction();

    try {
      await AppDataSource.query(
        "INSERT INTO Users ( name, email, password, cpfCnpj, imageUrl ) VALUES ( ?, ?, ?, ?, ? )",
        [user.name, user.email, hashedPassword, user.cpfCnpj, this.defaultImage]
      );
      await queryRunner.commitTransaction();
    } catch (e) {
      await queryRunner.rollbackTransaction();
      throw e;
    } finally {
      await queryRunner.release();
    }
  }

  async updateUserImage(userId: number, imageUrl: string) {
    try {
      await AppDataSource.query("UPDATE Users SET imageUrl = ? WHERE id = ?", [
        imageUrl,
        userId,
      ]);
    } catch (e) {
      throw e;
    }
  }
  async removeUserImage(userId: number) {
    try {
      await AppDataSource.query("UPDATE Users SET imageUrl = ? WHERE id = ?", [
        this.defaultImage,
        userId,
      ]);
    } catch (e) {
      throw e;
    }
  }

  async updateUser(user: UpdateUser) {
    try {
      await AppDataSource.query(
        "UPDATE Users SET name = ?, birthDate = ?, phone = ? WHERE id = ?",
        [user.name, user.birthDate, `${user.phone}`, user.id]
      );
    } catch (e) {
      throw e;
    }
  }

  async updatePassword(userId: number, password: string) {
    const passwordManager = PasswordManager.getInstance();
    const hashedPassword = passwordManager.hashPassword(password);

    try {
      await AppDataSource.query("UPDATE Users SET password = ? WHERE id = ?", [
        hashedPassword,
        userId,
      ]);
    } catch (e) {
      throw e;
    }
  }
  async deleteUser(userId: number) {
    const queryRunner = await AppDataSource.createQueryRunner();

    await queryRunner.startTransaction();

    try {
      await AppDataSource.query("DELETE FROM Reservation WHERE userId = ? ", [
        userId,
      ]);
      await AppDataSource.query("DELETE FROM Reviews WHERE userId = ? ", [
        userId,
      ]);
      await AppDataSource.query("DELETE FROM UserAddresses WHERE userId = ? ", [
        userId,
      ]);
      await AppDataSource.query("DELETE FROM Users WHERE id = ? ", [userId]);
      await queryRunner.commitTransaction();
    } catch (e) {
      await queryRunner.rollbackTransaction();

      throw e;
    } finally {
      await queryRunner.release();
    }
  }
}
