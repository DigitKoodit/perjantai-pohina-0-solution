import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:open_weather_example_flutter/src/features/weather/application/providers.dart';
import 'package:open_weather_example_flutter/src/features/weather/domain/weather/weather_data.dart';
import 'package:open_weather_example_flutter/src/features/weather/presentation/weather_icon_image.dart';

class WeeklyWeather extends ConsumerWidget {
  const WeeklyWeather({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastDataValue = ref.watch(weeklyWeatherProvider);

    return forecastDataValue.when(
      data: (forecastData) {
        // API returns data points in 3-hour intervals -> 1 day = 8 intervals
        final items = [0, 8, 16, 24, 32];
        return WeeklyWeatherRow(
          weatherDataItems: [
            for (var i in items) forecastData.list[i],
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, __) => Text(e.toString()),
    );
  }
}

class WeeklyWeatherRow extends StatelessWidget {
  const WeeklyWeatherRow({super.key, required this.weatherDataItems});
  final List<WeatherData> weatherDataItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: weatherDataItems
          .map((data) => WeeklyWeatherItem(data: data))
          .toList(),
    );
  }
}

class WeeklyWeatherItem extends ConsumerWidget {
  const WeeklyWeatherItem({super.key, required this.data});
  final WeatherData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    const fontWeight = FontWeight.normal;
    final unit = ref.watch(temperatureUnitProvider);

    final temp = data.temp.forUnit(unit).toInt().toString();
    return Expanded(
      child: Column(
        children: [
          Text(
            DateFormat.E().format(data.date),
            style: textTheme.bodySmall!.copyWith(fontWeight: fontWeight),
          ),
          const SizedBox(height: 8),
          WeatherIconImage(icon: data.icon, size: 48),
          const SizedBox(height: 8),
          Text(
            '$temp°',
            style: textTheme.bodyLarge!.copyWith(fontWeight: fontWeight),
          ),
        ],
      ),
    );
  }
}
