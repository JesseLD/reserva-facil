import { AppDataSource } from "../../../Database/database";

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
    return await AppDataSource.query("SELECT * FROM Users WHERE email = ?", [email]);
  }
  async getCpfCnpj(cpfcnpj: string) {
    return await AppDataSource.query("SELECT * FROM Users WHERE cpfcnpj = ?", [cpfcnpj]);
  }

}
