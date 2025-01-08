import {
  Column,
  Entity,
  Index,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Notifications } from "./Notifications";

@Index("NotificationTypes_pkey", ["id"], { unique: true })
@Entity("NotificationTypes", { schema: "public" })
export class NotificationTypes {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("character varying", { name: "name", nullable: true, length: 100 })
  name: string | null;

  @OneToMany(() => Notifications, (notifications) => notifications.type)
  notifications: Notifications[];
}
