import { AppDataSource } from "../../../Database/database";

export class BaseModelModel {
  async getAny() {
    return await AppDataSource.query("SELECT * FROM any");
  }
}
