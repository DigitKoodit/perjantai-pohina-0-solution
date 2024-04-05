import 'package:flutter/material.dart';
import 'package:open_weather_example_flutter/src/constants/app_colors.dart';
import 'package:open_weather_example_flutter/src/features/weather/presentation/city_search_box.dart';
import 'package:open_weather_example_flutter/src/features/weather/presentation/current_weather.dart';
import 'package:open_weather_example_flutter/src/features/weather/presentation/unit_picker.dart';
import 'package:open_weather_example_flutter/src/features/weather/presentation/weekly_weather.dart';

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
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              Image.asset(
                'assets/digit.png',
                height: 150,
              ),
              const Spacer(),
              const UnitPicker(),
              const Spacer(),
              const CitySearchBox(),
              const Spacer(flex: 2),
              const CurrentWeather(),
              const Spacer(flex: 2),
              const WeeklyWeather(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
