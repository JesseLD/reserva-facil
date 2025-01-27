import jwt from "jsonwebtoken";

import config from "../../../Config/config";

export class AuthToken {
  static generateToken(email: string) {
    const token = jwt.sign({ email }, config.jwt.secret, {
      expiresIn: config.jwt.expiresIn,

    } as jwt.SignOptions);

    return token;
  }

  static verifyToken(token: string) {
    try {
      const decoded = jwt.verify(token, config.jwt.secret);
      return decoded;
    } catch (e) {
      return null;
    }
  }
}
