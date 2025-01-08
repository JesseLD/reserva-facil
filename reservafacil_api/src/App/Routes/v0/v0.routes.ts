import { Router } from "express"; 
import { userRouter } from "../../Modules/Users/Routes/user.routes";

export const v0Router = Router();

v0Router.use("/user", userRouter);