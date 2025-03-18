import { Router } from "express";
import { storeController } from "../Controllers/StoreController";
import { validateRegister } from "../Validation/store-validate";

export const storeRouter = Router();

storeRouter.get("/", (req, res) => {
  res.send("Hello, any!");
});
storeRouter.get("/list", storeController.getStores);

storeRouter.get("/categories",storeController.getCategories);
storeRouter.get("/phone/:phone",storeController.getPhone);
storeRouter.get("/email/:email",storeController.getEmail);
storeRouter.get("/cpfcnpj/:cpfcnpj",storeController.getCpfCnpj);

storeRouter.post("/register", validateRegister,storeController.create);
