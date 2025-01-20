import { Router } from "express";
import { userRouter } from "../../Modules/Users/Routes/user.routes";
import { loginRouter } from "../../Modules/Login/Routes/login.routes";

export const v0Router = Router();

v0Router.use("/users", userRouter);
v0Router.use("/login", loginRouter);
