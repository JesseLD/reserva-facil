import { Router } from "express";

export const baseModuleRouter = Router();

baseModuleRouter.get("/", (req, res) => {
  res.send("Hello, any!");
});

baseModuleRouter.get("/:id", (req, res) => {
  res.send("Hello, any with id: " + req.params.id);
});
