import 'package:flutter/material.dart';
import 'package:weather_app/src/constants/app_colors.dart';
import 'package:weather_app/src/features/presentation/city_search_box.dart';
import 'package:weather_app/src/features/presentation/current_weather.dart';
import 'package:weather_app/src/features/presentation/hourly_weather.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key, required this.city});
  final String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.rainGradient,
              ),
            ),
            child: const SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(),
                CitySearchBox(),
                Spacer(),
                CurrentWeather(),
                Spacer(),
                HourlyWeather(),
                Spacer(),
              ],
            ))));
  }
}
