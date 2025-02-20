import { Router } from "express";
import { storeController } from "../Controllers/StoreController";

export const storeRouter = Router();

storeRouter.get("/", (req, res) => {
  res.send("Hello, any!");
});

storeRouter.get("/categories",storeController.getCategories);
storeRouter.get("/phone/:phone",storeController.getPhone);
storeRouter.get("/email/:email",storeController.getEmail);
storeRouter.get("/cpfcnpj/:cpfcnpj",storeController.getCpfCnpj);
