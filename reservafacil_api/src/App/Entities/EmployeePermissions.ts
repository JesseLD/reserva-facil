import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Employees } from "./Employees";
import { PermissionGroups } from "./PermissionGroups";

@Index("EmployeePermissions_pkey", ["id"], { unique: true })
@Entity("EmployeePermissions", { schema: "public" })
export class EmployeePermissions {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("timestamp without time zone", {
    name: "assigned_at",
    nullable: true,
  })
  assignedAt: Date | null;

  @ManyToOne(() => Employees, (employees) => employees.employeePermissions)
  @JoinColumn([{ name: "employee_id", referencedColumnName: "id" }])
  employee: Employees;

  @ManyToOne(
    () => PermissionGroups,
    (permissionGroups) => permissionGroups.employeePermissions
  )
  @JoinColumn([{ name: "group_id", referencedColumnName: "id" }])
  group: PermissionGroups;
}
