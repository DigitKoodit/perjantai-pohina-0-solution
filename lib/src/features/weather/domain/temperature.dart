import 'package:open_weather_example_flutter/src/features/weather/domain/temperature_unit.dart';

class Temperature {
  Temperature(this._value);

  final double _value;

  double forUnit(TemperatureUnit unit) => switch (unit) {
        TemperatureUnit.celsius => _value,
        TemperatureUnit.fahrenheit => _value * 1.8 + 32,
        TemperatureUnit.kelvin => _value - 273.15,
      };
}
