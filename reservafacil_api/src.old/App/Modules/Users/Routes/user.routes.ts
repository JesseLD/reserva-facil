import { Router } from "express"; 

export const userRouter = Router();

userRouter.get("/", (req, res) => {
  res.send("Hello, user!");
});

userRouter.get("/:id", (req, res) => {
  res.send("Hello, user with id: " + req.params.id);
});