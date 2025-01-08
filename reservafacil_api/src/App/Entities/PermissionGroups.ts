import {
  Column,
  Entity,
  Index,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { EmployeePermissions } from "./EmployeePermissions";

@Index("PermissionGroups_pkey", ["id"], { unique: true })
@Entity("PermissionGroups", { schema: "public" })
export class PermissionGroups {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("character varying", { name: "name", nullable: true, length: 100 })
  name: string | null;

  @Column("character varying", {
    name: "description",
    nullable: true,
    length: 255,
  })
  description: string | null;

  @Column("timestamp without time zone", { name: "created_at", nullable: true })
  createdAt: Date | null;

  @OneToMany(
    () => EmployeePermissions,
    (employeePermissions) => employeePermissions.group
  )
  employeePermissions: EmployeePermissions[];
}
