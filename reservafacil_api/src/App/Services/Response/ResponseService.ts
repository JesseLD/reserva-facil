import { Response } from 'express';

class ResponseService {
  public static send(res: Response, status: number, data: any) {
    res.status(status).json(data);
    return;
  }
}