import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather_example_flutter/src/constants/app_colors.dart';
import 'package:open_weather_example_flutter/src/features/weather/application/providers.dart';
import 'package:open_weather_example_flutter/src/features/weather/domain/temperature_unit.dart';

class UnitPicker extends ConsumerWidget {
  const UnitPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unit = ref.watch(temperatureUnitProvider);

    return DropdownButton<TemperatureUnit>(
      items: TemperatureUnit.values
          .map(
            (unit) => DropdownMenuItem<TemperatureUnit>(
              value: unit,
              child: Text(
                unit.name,
                style: const TextStyle(
                  fontSize: 20,
                  color: AppColors.accentColor,
                ),
              ),
            ),
          )
          .toList(),
      dropdownColor: AppColors.dialogBackground,
      value: unit,
      onChanged: (value) {
        ref.read(temperatureUnitProvider.notifier).state = value!;
      },
    );
  }
}
