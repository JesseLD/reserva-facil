import { AppDataSource } from "../../../Database/database";

export class BaseModel {
  async getAny() {
    return await AppDataSource.query("SELECT * FROM any");
  }
}
