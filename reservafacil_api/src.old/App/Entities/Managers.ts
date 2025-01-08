import {
  Column,
  Entity,
  Index,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { StoreManagers } from "./StoreManagers";

@Index("Managers_pkey", ["id"], { unique: true })
@Entity("Managers", { schema: "public" })
export class Managers {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("character varying", { name: "name", nullable: true, length: 100 })
  name: string | null;

  @Column("character varying", { name: "email", nullable: true, length: 150 })
  email: string | null;

  @Column("character varying", { name: "phone", nullable: true, length: 15 })
  phone: string | null;

  @OneToMany(() => StoreManagers, (storeManagers) => storeManagers.manager)
  storeManagers: StoreManagers[];
}
