import { Router } from "express";
import { ResponseService } from "../Services/Response/ResponseService";
import { ApiExceptions } from "../Services/Exceptions/exceptions";
import { authorization } from "../Middlewares/authorization";
import { v0Router } from "./v0/v0.routes";

export const indexRouter = Router();
// V0 Routes

indexRouter.use("/v0", authorization, v0Router);

indexRouter.use((req, res) => {
  ResponseService.sendException(res, ApiExceptions.NOT_FOUND);
});
