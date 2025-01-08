import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Reservation } from "./Reservation";
import { NotificationTypes } from "./NotificationTypes";

@Index("Notifications_pkey", ["id"], { unique: true })
@Entity("Notifications", { schema: "public" })
export class Notifications {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("boolean", { name: "sent", nullable: true })
  sent: boolean | null;

  @Column("timestamp without time zone", { name: "send_date", nullable: true })
  sendDate: Date | null;

  @Column("timestamp without time zone", { name: "sent_at", nullable: true })
  sentAt: Date | null;

  @Column("timestamp without time zone", { name: "created_at", nullable: true })
  createdAt: Date | null;

  @ManyToOne(() => Reservation, (reservation) => reservation.notifications)
  @JoinColumn([{ name: "reservation_id", referencedColumnName: "id" }])
  reservation: Reservation;

  @ManyToOne(
    () => NotificationTypes,
    (notificationTypes) => notificationTypes.notifications
  )
  @JoinColumn([{ name: "type_id", referencedColumnName: "id" }])
  type: NotificationTypes;
}
