import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_widget/views/widgets/weather_box_bottom_bar.dart';

class WeatherBox extends StatelessWidget {
  const WeatherBox({super.key});

  String getCurrentTime() {
    final now = DateTime.now();
    return DateFormat('h:mm a').format(now);
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final scale = currentWidth / 390;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: currentWidth * 0.99,
          height: currentWidth < 600 ? 400 : 1000,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100.withValues(alpha: 100),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getCurrentTime(),
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
                ),
                Text(
                  'Middleton Grange',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: (18 * scale).clamp(16, 22),
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      '72°F',
                      style: GoogleFonts.rokkitt(
                        color: Colors.white,
                        fontSize: 64,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(flex: 20),
                    Icon(
                      Icons.wb_sunny_rounded,
                      color: Colors.amber.shade400,
                      size: 64,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Partly Cloudy',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Feels like 75°F',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(spacing: 10, children: [WeatherBoxBottomBar()]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
