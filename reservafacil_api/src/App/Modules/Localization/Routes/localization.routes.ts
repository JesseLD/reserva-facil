import { Router } from "express";
import { localizationController } from "../Controllers/LocalizationController";

export const localizationRouter = Router();

localizationRouter.get("/", (req, res) => {
  res.send("Hello, any!");
});

localizationRouter.get("/cep/:cep", localizationController.getCepData);
localizationRouter.get("/states", localizationController.getStates);
