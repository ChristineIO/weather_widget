import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_widget/views/widgets/weather_box_bottom_bar_item.dart';

class WeatherBoxBottomBar extends StatelessWidget {
  const WeatherBoxBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 400,
        margin: const EdgeInsets.only(top: 25),
        padding: const EdgeInsets.fromLTRB(15, 20, 5, 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(49, 167, 227, 255),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  WeatherBoxBottomBarItem(
                    icon: Icons.water_drop,
                    label: 'Humidity',
                    value: '78%',
                  ),

                  const SizedBox(width: 50),

                  WeatherBoxBottomBarItem(
                    icon: Icons.air,
                    label: 'Wind',
                    value: '12 mph',
                  ),

                  const SizedBox(width: 50),

                  WeatherBoxBottomBarItem(
                    icon: Icons.remove_red_eye_outlined,
                    label: 'Visibility',
                    value: '10 mi',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
