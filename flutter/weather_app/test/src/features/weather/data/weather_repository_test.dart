import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/src/api/api.dart';
import 'package:weather_app/src/features/data/api_exception.dart';
import 'package:weather_app/src/features/data/weather_repository.dart';
import 'package:weather_app/src/features/domain/weather/weather.dart';

class MockHttpClient extends Mock implements http.Client {}

const encodedWeatherJsonResponse = """
{
  "coord": {
    "lon": 135.5022,
    "lat": 34.6937
  },
  "weather": [
    {
      "id": 804,
      "main": "Clouds",
      "description": "overcast clouds",
      "icon": "04n"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 17.27,
    "feels_like": 16.93,
    "temp_min": 16.31,
    "temp_max": 17.93,
    "pressure": 1024,
    "humidity": 72,
    "sea_level": 1024,
    "grnd_level": 1023
  },
  "visibility": 10000,
  "wind": {
    "speed": 1.03,
    "deg": 0
  },
  "clouds": {
    "all": 100
  },
  "dt": 1730384152,
  "sys": {
    "type": 1,
    "id": 8032,
    "country": "JP",
    "sunrise": 1730323046,
    "sunset": 1730361938
  },
  "timezone": 32400,
  "id": 1853909,
  "name": "Osaka",
  "cod": 200
}
""";

final expectedWeatherFromJson = Weather(
  weatherParams: WeatherParams(temp: 17.27, tempMin: 16.31, tempMax: 17.93),
  weatherInfo: [
    WeatherInfo(
      description: 'overcast clouds',
      icon: '04n',
      main: 'Clouds',
    )
  ],
  dt: 1730384152,
);

void main() {
  test('repository with mocked http client , success', () async {
    final mockHttpClient = MockHttpClient();
    final api = OpenWeatherMapAPI('apiKey');
    final weatherRepository =
        HttpWeatherRepository(api: api, client: mockHttpClient);

    when(() => mockHttpClient.get(api.weather('Osaka'))).thenAnswer(
        (_) => Future.value(http.Response(encodedWeatherJsonResponse, 200)));
    final weather = await weatherRepository.getWeather(city: 'Osaka');
    expect(weather, expectedWeatherFromJson);
  });

  test('repository with mocked http client , failure', () async {
    final mockHttpClient = MockHttpClient();
    final api = OpenWeatherMapAPI('apiKey');
    final weatherRepository =
        HttpWeatherRepository(api: api, client: mockHttpClient);

    when(() => mockHttpClient.get(api.weather('Osaka')))
        .thenAnswer((_) => Future.value(http.Response('{}', 401)));
    expect(() => weatherRepository.getWeather(city: 'Osaka'),
        throwsA(isA<APIException>()));
  });
}
