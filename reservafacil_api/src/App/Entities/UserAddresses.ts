import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Users } from "../Modules/Users/Entities/Users";

@Index("UserAddresses_pkey", ["id"], { unique: true })
@Entity("UserAddresses", { schema: "public" })
export class UserAddresses {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("character varying", { name: "cep", nullable: true, length: 9 })
  cep: string | null;

  @Column("character", { name: "state", nullable: true, length: 2 })
  state: string | null;

  @Column("character varying", { name: "city", nullable: true, length: 100 })
  city: string | null;

  @Column("character varying", {
    name: "neighborhood",
    nullable: true,
    length: 100,
  })
  neighborhood: string | null;

  @Column("character varying", {
    name: "address_line",
    nullable: true,
    length: 100,
  })
  addressLine: string | null;

  @Column("numeric", {
    name: "latitude",
    nullable: true,
    precision: 10,
    scale: 8,
  })
  latitude: string | null;

  @Column("numeric", {
    name: "longitude",
    nullable: true,
    precision: 11,
    scale: 8,
  })
  longitude: string | null;

  @ManyToOne(() => Users, (users) => users.userAddresses)
  @JoinColumn([{ name: "user_id", referencedColumnName: "id" }])
  user: Users;
}
