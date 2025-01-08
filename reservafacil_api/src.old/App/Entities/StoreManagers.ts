import {
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Managers } from "./Managers";
import { Store } from "./Store";

@Index("StoreManagers_pkey", ["id"], { unique: true })
@Entity("StoreManagers", { schema: "public" })
export class StoreManagers {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id: number;

  @ManyToOne(() => Managers, (managers) => managers.storeManagers)
  @JoinColumn([{ name: "manager_id", referencedColumnName: "id" }])
  manager: Managers;

  @ManyToOne(() => Store, (store) => store.storeManagers)
  @JoinColumn([{ name: "store_id", referencedColumnName: "id" }])
  store: Store;
}
