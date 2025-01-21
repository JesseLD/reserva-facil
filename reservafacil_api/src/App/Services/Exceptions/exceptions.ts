export interface ApiException {
  status: number;
  message: string;
  exception: string;
}

export const ApiExceptions: { [key: string]: ApiException } = {
  BAD_REQUEST: {
    status: 400,
    message: "Bad Request",
    exception: "BadRequestException",
  },
  UNAUTHORIZED: {
    status: 401,
    message: "Unauthorized",
    exception: "UnauthorizedException",
  },
  FORBIDDEN: {
    status: 403,
    message: "Forbidden",
    exception: "ForbiddenException",
  },
  NOT_FOUND: {
    status: 404,
    message: "Not Found",
    exception: "NotFoundException",
  },
  METHOD_NOT_ALLOWED: {
    status: 405,
    message: "Method Not Allowed",
    exception: "MethodNotAllowedException",
  },
  CONFLICT: {
    status: 409,
    message: "Conflict",
    exception: "ConflictException",
  },
  INTERNAL_SERVER_ERROR: {
    status: 500,
    message: "Internal Server Error",
    exception: "InternalServerErrorException",
  },
  SERVICE_UNAVAILABLE: {
    status: 503,
    message: "Service Unavailable",
    exception: "ServiceUnavailableException",
  },
  GATEWAY_TIMEOUT: {
    status: 504,
    message: "Gateway Timeout",
    exception: "GatewayTimeoutException",
  },
  INVALID_PASSWORD: {
    status: 400,
    message: "Invalid Password",
    exception: "InvalidPasswordException",
  },
  USER_NOT_FOUND: {
    status: 400,
    message: "User Not Found",
    exception: "UserNotFoundException",
  },
  USER_ALREADY_EXISTS: {
    status: 400,
    message: "User Already Exists",
    exception: "UserAlreadyExistsException",
  },
  INVALID_TOKEN: {
    status: 401,
    message: "Invalid Token",
    exception: "InvalidTokenException",
  },
  INVALID_CREDENTIALS: {
    status: 401,
    message: "Invalid Credentials",
    exception: "InvalidCredentialsException",
  },
  TOKEN_EXPIRED: {
    status: 401,
    message: "Token Expired",
    exception: "TokenExpiredException",
  },
  TOKEN_NOT_FOUND: {
    status: 401,
    message: "Token Not Found",
    exception: "TokenNotFoundException",
  },
  INVALID_FILE_TYPE: {
    status: 400,
    message: "Invalid File Type",
    exception: "InvalidFileTypeException",
  },
  FILE_TOO_LARGE: {
    status: 400,
    message: "File Too Large",
    exception: "FileTooLargeException",
  },
  FILE_NOT_FOUND: {
    status: 404,
    message: "File Not Found",
    exception: "FileNotFoundException",
  },
  FILE_UPLOAD_FAILED: {
    status: 500,
    message: "File Upload Failed",
    exception: "FileUploadFailedException",
  },
  INVALID_EMAIL: {
    status: 400,
    message: "Invalid Email",
    exception: "InvalidEmailException",
  },
  INVALID_IMAGE: {
    status: 400,
    message: "Invalid Image",
    exception: "InvalidImageException",
  },
  INVALID_JOB: {
    status: 400,
    message: "Invalid Job",
    exception: "InvalidJobException",
  },
};
