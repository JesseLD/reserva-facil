import { Router } from "express";
import { reservationController } from "../Controllers/ReservationController";

export const reservationRouter = Router();

reservationRouter.post("/create", reservationController.createReservation);

reservationRouter.get("/:id", (req, res) => {
  res.send("Hello, any with id: " + req.params.id);
});
