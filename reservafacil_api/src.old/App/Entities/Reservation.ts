import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Notifications } from "./Notifications";
import { ReservationStatus } from "./ReservationStatus";
import { Store } from "./Store";
import { Users } from "../Modules/Users/Entities/Users";

@Index("Reservation_pkey", ["id"], { unique: true })
@Entity("Reservation", { schema: "public" })
export class Reservation {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("timestamp without time zone", {
    name: "reservation_date",
    nullable: true,
  })
  reservationDate: Date | null;

  @Column("timestamp without time zone", { name: "enter_date", nullable: true })
  enterDate: Date | null;

  @Column("timestamp without time zone", { name: "exit_date", nullable: true })
  exitDate: Date | null;

  @Column("character varying", {
    name: "observation",
    nullable: true,
    length: 255,
  })
  observation: string | null;

  @Column("timestamp without time zone", { name: "created_at", nullable: true })
  createdAt: Date | null;

  @Column("numeric", {
    name: "total_value",
    nullable: true,
    precision: 10,
    scale: 2,
  })
  totalValue: string | null;

  @Column("numeric", {
    name: "paid_value",
    nullable: true,
    precision: 10,
    scale: 2,
  })
  paidValue: string | null;

  @OneToMany(() => Notifications, (notifications) => notifications.reservation)
  notifications: Notifications[];

  @ManyToOne(
    () => ReservationStatus,
    (reservationStatus) => reservationStatus.reservations
  )
  @JoinColumn([{ name: "status_id", referencedColumnName: "id" }])
  status: ReservationStatus;

  @ManyToOne(() => Store, (store) => store.reservations)
  @JoinColumn([{ name: "store_id", referencedColumnName: "id" }])
  store: Store;

  @ManyToOne(() => Users, (users) => users.reservations)
  @JoinColumn([{ name: "user_id", referencedColumnName: "id" }])
  user: Users;
}
