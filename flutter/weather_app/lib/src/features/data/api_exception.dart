sealed class APIException implements Exception {
  APIException(this.message);
  final String message;
}

class InvalidApiKeyException extends APIException {
  InvalidApiKeyException() : super('Invalid API');
}

class NoInternetConnectionException extends APIException {
  NoInternetConnectionException() : super('No internet connection');
}

class CityNotFoundException extends APIException {
  CityNotFoundException() : super('City not found');
}

class UnknownException extends APIException {
  UnknownException() : super('Unknown error occurred');
}
