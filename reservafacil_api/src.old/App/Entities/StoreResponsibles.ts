import {
  Column,
  Entity,
  Index,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Store } from "./Store";

@Index("StoreResponsibles_pkey", ["id"], { unique: true })
@Entity("StoreResponsibles", { schema: "public" })
export class StoreResponsibles {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("character varying", { name: "name", nullable: true, length: 100 })
  name: string | null;

  @Column("character varying", { name: "cpf", nullable: true, length: 11 })
  cpf: string | null;

  @OneToMany(() => Store, (store) => store.responsible)
  stores: Store[];
}
