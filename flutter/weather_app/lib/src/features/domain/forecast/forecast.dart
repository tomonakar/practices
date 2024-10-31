library forecast;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/features/domain/weather/weather.dart';

part 'forecast.freezed.dart';
part 'forecast.g.dart';

@freezed
class Forecast with _$Forecast {
  factory Forecast({
    required List<Weather> list,
  }) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}
