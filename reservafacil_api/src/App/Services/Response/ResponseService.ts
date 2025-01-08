import { Response } from "express";
import { ApiException } from "../Exceptions/exceptions";

export class ResponseService {
  public static sendResponse(
    res: Response,
    status: number = 200,
    message: string,
    data: any = null
  ) {
    res.status(status).json({
      message: message,
      data: data,
    });
    return;
  }

  public static sendException(res: Response, apiException: ApiException) {
    res.status(apiException.status).json({
      message: apiException.message,
      exception: apiException.exception,
      data: [],
    });
    return;
  }
}

