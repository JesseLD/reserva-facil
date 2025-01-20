import { Router } from "express";
import {
  validateCreateUser,
  validateRecoverPassword,
} from "../Validation/user-validate";
import { userController } from "../Controllers/UserController";

export const userRouter = Router();

// userRouter.get("/", (req, res) => {
//   res.send("Hello, user!");
// });

// userRouter.get("/:id", (req, res) => {
//   res.send("Hello, user with id: " + req.params.id);
// });

userRouter.post("/create", validateCreateUser, userController.createUser);
userRouter.post(
  "/recover-password",
  validateRecoverPassword,
  userController.sendMail
);
