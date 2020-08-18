import {Request, Response, NextFunction} from 'express';
import {RequestValidationError} from "../errors/request-validation-error";
import {DatabaseConnectionError} from "../errors/database-connection-error";

export const errorHandler = (
  err: Error,
  req: Request,
  res: Response,
  next: NextFunction
) => {
  if (err instanceof RequestValidationError) {
    console.log('request validation error', err);

  }
  if (err instanceof DatabaseConnectionError) {
    console.log('database connection error', err);
  }
  res.status(400).send({
    message: err.message
  });
};