export class CodeGen {
  static codeLength: number = 6;


  static generateCode() {
    let code = "";
    for (let i = 0; i < this.codeLength; i++) {
      code += Math.floor(Math.random() * 10);
    }
    return code;
  }
}