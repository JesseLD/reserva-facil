import {
  Column,
  Entity,
  Index,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { ActiveSessions } from "./ActiveSessions";

@Index("ClientType_pkey", ["id"], { unique: true })
@Entity("ClientType", { schema: "public" })
export class ClientType {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("character varying", { name: "name", nullable: true, length: 50 })
  name: string | null;

  @OneToMany(
    () => ActiveSessions,
    (activeSessions) => activeSessions.clientType
  )
  activeSessions: ActiveSessions[];
}
