import { AppDataSource } from "../../../Database/database";

export class SupportModel {
  async insertPassword({
    password,
    expiresAt,
  }: {
    password: string;
    expiresAt: string;
  }) {
    return await AppDataSource.query(
      "INSERT INTO SupportSessions (supportKey, expiresAt, status) VALUES (?, ?, ?)",
      [password, expiresAt, "active"]
    );
  }

  async getPassword(supportKey: string) {
    // console.log("supportKey", supportKey);
    const key = await AppDataSource.query(
      "SELECT * FROM SupportSessions WHERE supportKey = ?",
      [supportKey]
    );

    if (key.length === 0) {
      return null;
    }
    // console.log("supportKey", key);

    if (key[0].createdAt < new Date()) {
      return null;
    }

    if (key[0].status != "active") {
      return null;
    }

    return key[0];
  }
}
