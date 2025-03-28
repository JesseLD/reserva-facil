import config from "../../../Config/config";
import bcrypt from "bcryptjs";

export class PasswordManager {
  private static instance: PasswordManager;

  private constructor() {}

  public static getInstance(): PasswordManager {
    if (!PasswordManager.instance) {
      PasswordManager.instance = new PasswordManager();
    }

    return PasswordManager.instance;
  }

  public hashPassword(password: string): string {
    return bcrypt.hashSync(password, 12);
  }

  public comparePassword( password: string, passwordHash: string): boolean {
    return bcrypt.compareSync(password, passwordHash);
  }
}
