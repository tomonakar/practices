import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:weather_app/src/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/src/api/api_keys.dart';
import 'package:weather_app/src/features/data/api_exception.dart';
import 'package:weather_app/src/features/domain/forecast/forecast.dart';
import 'package:weather_app/src/features/domain/weather/weather.dart';

/// Weather Repository using the http client. Calls API methods and parses the response.
class HttpWeatherRepository {
  HttpWeatherRepository({required this.api, required this.client});
  final OpenWeatherMapAPI api;
  final http.Client client;

  Future<Forecast> getForecast({required String city}) => _getData(
        uri: api.forecast(city),
        builder: (data) => Forecast.fromJson(data),
      );

  Future<Weather> getWeather({required String city}) => _getData(
        uri: api.weather(city),
        builder: (data) => Weather.fromJson(data),
      );

  Future<T> _getData<T>({
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.get(uri);
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return builder(data);
        case 401:
          throw InvalidApiKeyException();
        case 404:
          throw CityNotFoundException();
        default:
          throw UnknownException();
      }
    } on SocketException catch (e) {
      print(e);
      throw NoInternetConnectionException();
    }
  }
}

/// Providers used by rest of the app
final weatherRepositoryProvider = Provider<HttpWeatherRepository>((ref) {
  /// Use the API key passed via --dart-define,
  /// or fallback to the one defined in api_keys.dart
  // set key to const
  const apiKey = String.fromEnvironment('API_KEY',
      defaultValue: APIKeys.openWeatherAPIKey);

  print(apiKey);
  return HttpWeatherRepository(
      api: OpenWeatherMapAPI(apiKey), client: http.Client());
});
