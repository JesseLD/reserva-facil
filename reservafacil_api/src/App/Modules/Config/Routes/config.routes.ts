import { Router } from "express";
import { configController } from "../Controllers/ConfigController";

export const configRouter = Router();

configRouter.get("/", configController.getSettings);

// configRouter.get("/:id", (req, res) => {
//   res.send("Hello, any with id: " + req.params.id);
// });
