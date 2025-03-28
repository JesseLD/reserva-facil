export class UpdateUser {
  id: number;
  name: string;
  birthDate: string;
  phone: string;

  constructor(id: number, name: string, birthDate: string, phone: string) {
    this.id = id;
    this.name = name;
    this.birthDate = birthDate;
    this.phone = phone;
  }
}
