import config from "../../../../Config/config";
import { AppDataSource } from "../../../Database/database";
import { PasswordManager } from "../../../Services/PasswordManager/PasswordManager";
import { Store } from "../Entities/Store";

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


  async getStoresByCep(cep: string) {
    return await AppDataSource.query(`
    SELECT
        *
    FROM
        Store
    JOIN
      StoreLocalization ON StoreLocalization.storeId = Store.id
    WHERE
        StoreLocalization.cep = ?`, [
          cep,
    ]);
  }

  async create(store: Store) {
    const passwordManager = PasswordManager.getInstance();
    const hashedPassword = passwordManager.hashPassword(store.password);
    // const queryRunner = AppDataSource.createQueryRunner();

    // await queryRunner.startTransaction();

    const exists = await AppDataSource.query(
      "SELECT * FROM Store WHERE email = ? OR phone = ? OR cpfCnpj = ?",
      [store.email, store.phone, store.cpfCnpj]
    );

    if (exists.length) {
      throw new Error("Email, phone or cpfCnpj already in use");
    }

    try {
      await AppDataSource.query(
        "INSERT INTO Store ( name, email, phone, password, cpfCnpj, logoUrl, reservationCapacity, maxPartySize, categoryId ) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ? )",
        [
          store.name,
          store.email,
          store.phone,
          hashedPassword,
          store.cpfCnpj,
          config.api_url + "/uploads" +  "/default-avatar.jpeg",
          store.reservationCapacity,
          store.maxPartySize,
          store.category,
        ]
      );

      const result = await AppDataSource.query("SELECT LAST_INSERT_ID() as id");
      const storeId = result[0].id;

      await AppDataSource.query(
        "INSERT INTO StoreLocalization ( storeId, cep, stateId, city, address ) VALUES ( ?, ?, ?, ?, ? )",
        [storeId, store.cep, store.state, store.city, store.address]
      );

      // await queryRunner.commitTransaction();
    } catch (e) {
      throw e;
    }
  }
}
