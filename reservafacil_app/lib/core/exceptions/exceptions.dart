class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
  @override
  String toString() => 'NetworkException: $message';
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);
  @override
  String toString() => 'AuthException: $message';
}

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
  @override
  String toString() => 'ServerException: $message';
}


class ApiException implements Exception {
  final String message;
  final int? code;
  final String? endpoint;
  final DateTime? timestamp;

  ApiException({
    required this.message,
    this.code,
    this.endpoint,
    this.timestamp,
  });

  @override
  String toString() {
    return 'ApiException: $message (Code: $code, Endpoint: $endpoint, Time: $timestamp)';
  }
}
