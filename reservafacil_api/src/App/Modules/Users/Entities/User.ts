export class User {
  name: string;
  email: string;
  password: string;
  cpfCnpj: string;



  constructor(name: string, email: string, password: string, cpfCnpj: string) {
    this.name = name;
    this.email = email;
    this.password = password;
    this.cpfCnpj = cpfCnpj;

  }
}
