import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Employees } from "./Employees";
import { Localization } from "./Localization";
import { Menu } from "./Menu";
import { OpeningTimes } from "./OpeningTimes";
import { Reservation } from "./Reservation";
import { Reviews } from "./Reviews";
import { StoreCategories } from "./StoreCategories";
import { StoreResponsibles } from "./StoreResponsibles";
import { StoreManagers } from "./StoreManagers";
import { Users } from "../Modules/Users/Entities/Users";

@Index("Store_pkey", ["id"], { unique: true })
@Entity("Store", { schema: "public" })
export class Store {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("character varying", { name: "name", nullable: true, length: 100 })
  name: string | null;

  @Column("text", { name: "description", nullable: true })
  description: string | null;

  @Column("boolean", { name: "active", nullable: true })
  active: boolean | null;

  @Column("character varying", {
    name: "logo_url",
    nullable: true,
    length: 255,
  })
  logoUrl: string | null;

  @Column("character varying", { name: "phone", nullable: true, length: 15 })
  phone: string | null;

  @Column("integer", { name: "reservation_capacity", nullable: true })
  reservationCapacity: number | null;

  @Column("timestamp without time zone", { name: "created_at", nullable: true })
  createdAt: Date | null;

  @OneToMany(() => Employees, (employees) => employees.store)
  employees: Employees[];

  @OneToMany(() => Localization, (localization) => localization.store)
  localizations: Localization[];

  @OneToMany(() => Menu, (menu) => menu.store)
  menus: Menu[];

  @OneToMany(() => OpeningTimes, (openingTimes) => openingTimes.store)
  openingTimes: OpeningTimes[];

  @OneToMany(() => Reservation, (reservation) => reservation.store)
  reservations: Reservation[];

  @OneToMany(() => Reviews, (reviews) => reviews.store)
  reviews: Reviews[];

  @ManyToOne(() => StoreCategories, (storeCategories) => storeCategories.stores)
  @JoinColumn([{ name: "category_id", referencedColumnName: "id" }])
  category: StoreCategories;

  @ManyToOne(
    () => StoreResponsibles,
    (storeResponsibles) => storeResponsibles.stores
  )
  @JoinColumn([{ name: "responsible_id", referencedColumnName: "id" }])
  responsible: StoreResponsibles;

  @OneToMany(() => StoreManagers, (storeManagers) => storeManagers.store)
  storeManagers: StoreManagers[];

  @OneToMany(() => Users, (users) => users.store)
  users: Users[];
}
