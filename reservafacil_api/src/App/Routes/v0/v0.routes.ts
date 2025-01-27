import { Router } from "express";
import { userRouter } from "../../Modules/Users/Routes/user.routes";
import { loginRouter } from "../../Modules/Login/Routes/login.routes";
import { uploadRouter } from "../../Modules/Upload/Routes/upload.routes";
import { authenticate } from "../../Middlewares/authenticate";

export const v0Router = Router();

v0Router.use("/users", authenticate, userRouter);
v0Router.use("/login", loginRouter);
v0Router.use("/upload", uploadRouter);
