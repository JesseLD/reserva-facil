class Store {
  name: string;
  phone: string;
  email: string;
  cpfCnpj: string;
  password: string;
  cep: string;
  state: number;
  city: string;
  address: string;
  storeName: string;
  category: number;

  constructor(
    name: string,
    phone: string,
    email: string,
    cpfCnpj: string,
    password: string,
    cep: string,
    state: number,
    city: string,
    address: string,
    storeName: string,
    category: number
  ) {
    this.name = name;
    this.phone = phone;
    this.email = email;
    this.cpfCnpj = cpfCnpj;
    this.password = password;
    this.cep = cep;
    this.state = state;
    this.city = city;
    this.address = address;
    this.storeName = storeName;
    this.category = category;
  }
}
