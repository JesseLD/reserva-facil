import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { MenuCategories } from "./MenuCategories";
import { Store } from "./Store";

@Index("Menu_pkey", ["id"], { unique: true })
@Entity("Menu", { schema: "public" })
export class Menu {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("character varying", { name: "name", nullable: true, length: 100 })
  name: string | null;

  @Column("text", { name: "description", nullable: true })
  description: string | null;

  @Column("numeric", { name: "price", nullable: true, precision: 10, scale: 2 })
  price: string | null;

  @ManyToOne(() => MenuCategories, (menuCategories) => menuCategories.menus)
  @JoinColumn([{ name: "category_id", referencedColumnName: "id" }])
  category: MenuCategories;

  @ManyToOne(() => Store, (store) => store.menus)
  @JoinColumn([{ name: "store_id", referencedColumnName: "id" }])
  store: Store;
}
