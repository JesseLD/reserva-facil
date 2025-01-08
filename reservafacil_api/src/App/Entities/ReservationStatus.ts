import {
  Column,
  Entity,
  Index,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Reservation } from "./Reservation";

@Index("ReservationStatus_pkey", ["id"], { unique: true })
@Entity("ReservationStatus", { schema: "public" })
export class ReservationStatus {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("character varying", { name: "name", nullable: true, length: 50 })
  name: string | null;

  @OneToMany(() => Reservation, (reservation) => reservation.status)
  reservations: Reservation[];
}
