import { Router } from "express";
import { supportController } from "../Controllers/SupportController";

export const supportRouter = Router();

supportRouter.post("/generate-password", supportController.generateSupportPassword);

supportRouter.get("/get-password/:supportKey", supportController.getSupportPassword);
