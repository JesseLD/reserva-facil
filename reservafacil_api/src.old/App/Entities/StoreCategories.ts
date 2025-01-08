import {
  Column,
  Entity,
  Index,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Store } from "./Store";

@Index("StoreCategories_pkey", ["id"], { unique: true })
@Entity("StoreCategories", { schema: "public" })
export class StoreCategories {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("character varying", { name: "name", nullable: true, length: 100 })
  name: string | null;

  @Column("character varying", {
    name: "description",
    nullable: true,
    length: 255,
  })
  description: string | null;

  @OneToMany(() => Store, (store) => store.category)
  stores: Store[];
}
