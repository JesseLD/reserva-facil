import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Store } from "./Store";

@Index("OpeningTimes_pkey", ["id"], { unique: true })
@Entity("OpeningTimes", { schema: "public" })
export class OpeningTimes {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("smallint", { name: "week_day", nullable: true })
  weekDay: number | null;

  @Column("time without time zone", { name: "opening_time", nullable: true })
  openingTime: string | null;

  @Column("time without time zone", { name: "close_time", nullable: true })
  closeTime: string | null;

  @Column("boolean", { name: "active", nullable: true })
  active: boolean | null;

  @ManyToOne(() => Store, (store) => store.openingTimes)
  @JoinColumn([{ name: "store_id", referencedColumnName: "id" }])
  store: Store;
}
