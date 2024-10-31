import 'package:weather_app/src/features/domain/temperature.dart';
import 'package:weather_app/src/features/domain/weather/weather.dart';

/// Divided model class used in the UI
class WeatherData {
  WeatherData({
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.description,
    required this.date,
    required this.icon,
  });

  factory WeatherData.from(Weather weather) {
    return WeatherData(
        temp: Temperature.celsius(weather.weatherParams.temp),
        minTemp: Temperature.celsius(weather.weatherParams.tempMin),
        maxTemp: Temperature.celsius(weather.weatherParams.tempMax),
        description: weather.weatherInfo.first.main,
        date: DateTime.fromMillisecondsSinceEpoch(weather.dt * 1000),
        icon: weather.weatherInfo.first.icon);
  }

  final Temperature temp;
  final Temperature minTemp;
  final Temperature maxTemp;
  final String description;
  final DateTime date;
  final String icon;

  String get iconUrl => 'https://openweathermap.org/img/wn/$icon@2x.png';
}
