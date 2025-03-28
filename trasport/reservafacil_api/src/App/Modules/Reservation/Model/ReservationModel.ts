import { AppDataSource } from "../../../Database/database";

export class ReservationModel {
  async getAny() {
    return await AppDataSource.query("SELECT * FROM any");
  }
}
