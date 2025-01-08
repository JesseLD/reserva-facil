import {
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Permissions } from "./Permissions";
import { Roles } from "./Roles";

@Index("RolePermissions_pkey", ["id"], { unique: true })
@Entity("RolePermissions", { schema: "public" })
export class RolePermissions {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @ManyToOne(() => Permissions, (permissions) => permissions.rolePermissions)
  @JoinColumn([{ name: "permission_id", referencedColumnName: "id" }])
  permission: Permissions;

  @ManyToOne(() => Roles, (roles) => roles.rolePermissions)
  @JoinColumn([{ name: "role_id", referencedColumnName: "id" }])
  role: Roles;
}
