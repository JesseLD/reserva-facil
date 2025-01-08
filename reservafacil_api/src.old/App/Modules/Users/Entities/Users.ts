import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Reservation } from "../../../Entities/Reservation";
import { Reviews } from "../../../Entities/Reviews";
import { UserAddresses } from "../../../Entities/UserAddresses";
import { Store } from "../../../Entities/Store";

@Index("Users_cpf_cnpj_key", ["cpfCnpj"], { unique: true })
@Index("Users_email_key", ["email"], { unique: true })
@Index("Users_pkey", ["id"], { unique: true })
@Entity("Users", { schema: "public" })
export class Users {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("character varying", { name: "name", nullable: true, length: 100 })
  name: string | null;

  @Column("character varying", {
    name: "email",
    nullable: true,
    unique: true,
    length: 150,
  })
  email: string | null;

  @Column("character varying", {
    name: "password",
    nullable: true,
    length: 255,
  })
  password: string | null;

  @Column("character varying", { name: "phone", nullable: true, length: 15 })
  phone: string | null;

  @Column("date", { name: "birth_date", nullable: true })
  birthDate: string | null;

  @Column("character varying", {
    name: "cpf_cnpj",
    nullable: true,
    unique: true,
    length: 14,
  })
  cpfCnpj: string | null;

  @Column("boolean", { name: "active", nullable: true })
  active: boolean | null;

  @Column("timestamp without time zone", { name: "created_at", nullable: true })
  createdAt: Date | null;

  @Column("timestamp without time zone", { name: "updated_at", nullable: true })
  updatedAt: Date | null;

  @OneToMany(() => Reservation, (reservation) => reservation.user)
  reservations: Reservation[];

  @OneToMany(() => Reviews, (reviews) => reviews.user)
  reviews: Reviews[];

  @OneToMany(() => UserAddresses, (userAddresses) => userAddresses.user)
  userAddresses: UserAddresses[];

  @ManyToOne(() => Store, (store) => store.users)
  @JoinColumn([{ name: "store_id", referencedColumnName: "id" }])
  store: Store;
}
