import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Store } from "./Store";

@Index("Localization_pkey", ["id"], { unique: true })
@Entity("Localization", { schema: "public" })
export class Localization {
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
    name: "complement",
    nullable: true,
    length: 100,
  })
  complement: string | null;

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

  @Column("character varying", { name: "map_url", nullable: true, length: 255 })
  mapUrl: string | null;

  @ManyToOne(() => Store, (store) => store.localizations)
  @JoinColumn([{ name: "store_id", referencedColumnName: "id" }])
  store: Store;
}
