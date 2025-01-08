import {
  Column,
  Entity,
  Index,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Menu } from "./Menu";

@Index("MenuCategories_pkey", ["id"], { unique: true })
@Entity("MenuCategories", { schema: "public" })
export class MenuCategories {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("character varying", { name: "name", nullable: true, length: 100 })
  name: string | null;

  @OneToMany(() => Menu, (menu) => menu.category)
  menus: Menu[];
}
