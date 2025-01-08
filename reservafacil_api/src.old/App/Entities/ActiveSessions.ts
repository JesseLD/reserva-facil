import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { ClientType } from "./ClientType";

@Index("ActiveSessions_pkey", ["id"], { unique: true })
@Entity("ActiveSessions", { schema: "public" })
export class ActiveSessions {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("integer", { name: "client_id", nullable: true })
  clientId: number | null;

  @Column("character varying", {
    name: "session_token",
    nullable: true,
    length: 255,
  })
  sessionToken: string | null;

  @Column("character varying", {
    name: "ip_address",
    nullable: true,
    length: 45,
  })
  ipAddress: string | null;

  @Column("character varying", {
    name: "user_agent",
    nullable: true,
    length: 255,
  })
  userAgent: string | null;

  @Column("timestamp without time zone", { name: "created_at", nullable: true })
  createdAt: Date | null;

  @Column("timestamp without time zone", { name: "updated_at", nullable: true })
  updatedAt: Date | null;

  @Column("timestamp without time zone", {
    name: "last_activity",
    nullable: true,
  })
  lastActivity: Date | null;

  @Column("boolean", { name: "expired", nullable: true })
  expired: boolean | null;

  @ManyToOne(() => ClientType, (clientType) => clientType.activeSessions)
  @JoinColumn([{ name: "client_type_id", referencedColumnName: "id" }])
  clientType: ClientType;
}
