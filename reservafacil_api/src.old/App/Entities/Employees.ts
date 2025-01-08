import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { EmployeePermissions } from "./EmployeePermissions";
import { Roles } from "./Roles";
import { Store } from "./Store";

@Index("Employees_email_key", ["email"], { unique: true })
@Index("Employees_pkey", ["id"], { unique: true })
@Entity("Employees", { schema: "public" })
export class Employees {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @Column("character varying", { name: "name", nullable: true, length: 100 })
  name: string | null;

  @Column("character varying", {
    name: "email",
    nullable: true,
    unique: true,
    length: 150,
  })
  email: string | null;

  @Column("character varying", { name: "phone", nullable: true, length: 15 })
  phone: string | null;

  @Column("boolean", { name: "active", nullable: true })
  active: boolean | null;

  @Column("timestamp without time zone", { name: "created_at", nullable: true })
  createdAt: Date | null;

  @Column("timestamp without time zone", { name: "updated_at", nullable: true })
  updatedAt: Date | null;

  @OneToMany(
    () => EmployeePermissions,
    (employeePermissions) => employeePermissions.employee
  )
  employeePermissions: EmployeePermissions[];

  @ManyToOne(() => Roles, (roles) => roles.employees)
  @JoinColumn([{ name: "role_id", referencedColumnName: "id" }])
  role: Roles;

  @ManyToOne(() => Store, (store) => store.employees)
  @JoinColumn([{ name: "store_id", referencedColumnName: "id" }])
  store: Store;
}
