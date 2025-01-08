import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Store } from "./Store";
import { Users } from "../Modules/Users/Entities/Users";

@Index("Reviews_pkey", ["id"], { unique: true })
@Entity("Reviews", { schema: "public" })
export class Reviews {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("smallint", { name: "note", nullable: true })
  note: number | null;

  @Column("text", { name: "comment", nullable: true })
  comment: string | null;

  @Column("timestamp without time zone", { name: "created_at", nullable: true })
  createdAt: Date | null;

  @ManyToOne(() => Store, (store) => store.reviews)
  @JoinColumn([{ name: "store_id", referencedColumnName: "id" }])
  store: Store;

  @ManyToOne(() => Users, (users) => users.reviews)
  @JoinColumn([{ name: "user_id", referencedColumnName: "id" }])
  user: Users;
}
