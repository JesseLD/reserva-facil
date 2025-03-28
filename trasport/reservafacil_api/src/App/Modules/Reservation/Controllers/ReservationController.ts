import { Request, Response } from "express";
import { ReservationModel } from "../Model/ReservationModel";
import { ResponseService } from "../../../Services/Response/ResponseService";
export class ReservationController {
  
  async createReservation(req: Request, res: Response) {
    const reservation = new ReservationModel();
    // const any = await reservation.getAny();

    console.log("Creating Reservation...");
    console.log("Saving Reservation...");
    console.log("Sending Confirmation Email...");
    console.log("Updating Partner Panel...");
    // console.log("Updating Partner Panel...");
    // console.log("Sending Email...");

    return ResponseService.sendResponse(res, "Reservation Created With Success!", );
  }
 
}

export const reservationController = new ReservationController();
