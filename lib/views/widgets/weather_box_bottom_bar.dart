import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_widget/views/widgets/weather_box_bottom_bar_item.dart';

class WeatherBoxBottomBar extends StatelessWidget {
  const WeatherBoxBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 25),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(49, 167, 227, 255),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 25,
          children: const [
            WeatherBoxBottomBarItem(
              icon: Icons.water_drop,
              label: 'Humidity',
              value: '78%',
            ),
            WeatherBoxBottomBarItem(
              icon: Icons.air,
              label: 'Wind',
              value: '12 mph',
            ),
            WeatherBoxBottomBarItem(
              icon: Icons.remove_red_eye_outlined,
              label: 'Visibility',
              value: '10 mi',
            ),
          ],
        ),
      ),
    );
  }
}
