import { Request, Response, Router } from "express";
import { ResponseService } from "../Services/Response/ResponseService";
import { ApiExceptions } from "../Services/Exceptions/exceptions";
import { authorization } from "../Middlewares/authorization";
import { v0Router } from "./v0/v0.routes";
import path from "path";
import express from "express";
import { mailService } from "../Services/Mail/MailService";

export const indexRouter = Router();
// V0 Routes

indexRouter.use("/v0", authorization, v0Router);

// indexRouter.use("/uploads", authorization, express.static(path.join(__dirname,"..","..","..","uploads")));
indexRouter.use(
  "/uploads",
  express.static(path.join(__dirname, "..", "..", "..", "uploads"))
);

indexRouter.post("/email", async (req: Request, res: Response) => {
  const {
    target,
    subject,
    name,
    date,
    time,
    people,
    restaurant,
    observations,
    type,
  } = req.body;

  // if (
  //   // !target ||
  //   // !subject ||
  //   // !name ||
  //   // !date ||
  //   // !time ||
  //   // !people ||
  //   // !restaurant ||
  //   // !observations ||
  //   // !type
  // ) {
  //   res.status(400).json({ message: "Missing fields" });
  //   return;
  // }

  await mailService.sendReservationEmail(
    target,
    subject,
    name,
    date,
    time,
    people,
    restaurant,
    observations,
    type
  )

  res.status(200).json({ message: "Email sent" });

});

indexRouter.use((req, res) => {
  ResponseService.sendException(res, ApiExceptions.NOT_FOUND);
});
