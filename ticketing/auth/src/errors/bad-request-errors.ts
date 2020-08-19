import { CustomError } from './custom-error';

export class BadRequestErrors extends CustomError {
  statusCode = 400;

  serializeErrors(): { message: string; field?: string }[] {
    return [{message:''}];
  }
}