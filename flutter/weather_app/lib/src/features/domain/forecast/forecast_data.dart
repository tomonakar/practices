import 'package:weather_app/src/features/domain/forecast/forecast.dart';
import 'package:weather_app/src/features/domain/weather/weather_data.dart';

/// Divided model class used in the UI
class ForecastData {
  const ForecastData(this.list);
  factory ForecastData.from(Forecast forecast) {
    return ForecastData(
      forecast.list.map((item) => WeatherData.from(item)).toList(),
    );
  }

  final List<WeatherData> list;
}
