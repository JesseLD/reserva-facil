import { AppDataSource } from "../../../Database/database";

export class LocalizationModel {
  async getAny() {
    return await AppDataSource.query("SELECT * FROM any");
  }
  async getStates() {
    return await AppDataSource.query("SELECT * FROM States");
  }
}
