import { Router } from "express";
import { loginController } from "../Controllers/LoginController";
import { validateLogin } from "../Validation/login-validate";

export const loginRouter = Router();

loginRouter.post("/", validateLogin, loginController.login);

// loginRouter.get("/:id", (req, res) => {
//   res.send("Hello, any with id: " + req.params.id);
// });
