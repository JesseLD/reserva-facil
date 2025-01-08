import { IsNotEmpty, IsString } from "class-validator";

export class CreateUserDTO {
  @IsString()
  @IsNotEmpty({ message: "Name is required" })
  name: string;

  @IsString()
  @IsNotEmpty({ message: "Email is required" })
  email: string;

  @IsString()
  @IsNotEmpty({ message: "CPF is required" })
  cpf: string;

  @IsString()
  @IsNotEmpty({ message: "Password is required" })
  password: string;
}
