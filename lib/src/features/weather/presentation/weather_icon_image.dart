import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:open_weather_example_flutter/src/constants/app_colors.dart';

class WeatherIconImage extends StatelessWidget {
  const WeatherIconImage({
    super.key,
    required this.icon,
    required this.size,
  });
  final String icon;
  final double size;

  static final _iconMappings = {
    '01': '🍾',
    '02': '🥂',
    '03': '🍻',
    '04': '🥃',
    '09': '🍸',
    '10': '🍹',
    '11': '🥛',
    '13': '🫗',
    '50': '🍺',
  };

  @override
  Widget build(BuildContext context) {
    final textIcon = _iconMappings[icon.substring(0, 2)];

    if (textIcon != null) {
      return Text(
        textIcon,
        style: TextStyle(
          fontSize: size,
          color: AppColors.accentColor,
        ),
      );
    }

    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        AppColors.accentColor.withOpacity(0.4),
        BlendMode.srcATop,
      ),
      child: CachedNetworkImage(
        imageUrl: "https://openweathermap.org/img/wn/$icon@2x.png",
        width: size,
        height: size,
      ),
    );
  }
}
