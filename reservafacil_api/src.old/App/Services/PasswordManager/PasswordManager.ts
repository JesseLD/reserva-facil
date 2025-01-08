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

  public generatePassword(password: string): string {
    return bcrypt.hashSync(password,config.password.salt);
  }

  public validatePassword(passwordHash: string, password: string): boolean {
    return bcrypt.compareSync(passwordHash, password);
  }
}
