import { AppDataSource } from "../../../Database/database";
import { PasswordManager } from "../../../Services/PasswordManager/PasswordManager";

export class StoreModel {
  async getCategories() {
    return await AppDataSource.query("SELECT * FROM StoreCategories");
  }

  async getPhone(contact: string) {
    return await AppDataSource.query("SELECT * FROM Users WHERE phone = ?", [
      contact,
    ]);
  }
  async getEmail(email: string) {
    return await AppDataSource.query("SELECT * FROM Users WHERE email = ?", [
      email,
    ]);
  }
  async getCpfCnpj(cpfcnpj: string) {
    return await AppDataSource.query("SELECT * FROM Users WHERE cpfcnpj = ?", [
      cpfcnpj,
    ]);
  }

  async create(store: Store) {

    const passwordManager = PasswordManager.getInstance();
    const hashedPassword = passwordManager.hashPassword(store.password);
    const queryRunner = AppDataSource.createQueryRunner();

    await queryRunner.startTransaction();

    try {
      await queryRunner.query(
        "INSERT INTO Store ( name, email, phone, password, cpfCnpj, imageUrl ) VALUES ( ?, ?, ?, ?, ?, ? )",
        [
          store.name,
          store.email,
          store.phone,
          hashedPassword,
          store.cpfCnpj,
          "default-avatar.jpeg",
        ]
      );

       await queryRunner.query(
         "INSERT INTO Users ( name, email, phone, password, cpfCnpj, imageUrl ) VALUES ( ?, ?, ?, ?, ?, ? )",
         [
           store.name,
           store.email,
           store.phone,
           hashedPassword,
           store.cpfCnpj,
           "default-avatar.jpeg",
         ]
       );

      const result = await queryRunner.query("SELECT LAST_INSERT_ID() as id");
      const userId = result[0].id;


      // await queryRunner.commitTransaction();



    } catch (e) {
      queryRunner.rollbackTransaction();
      throw e;
    } finally {
      await queryRunner.release();
    }
  }
}
