import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_widget/responsive/my_screen.dart';
import 'package:weather_widget/views/widgets/degree_buttons.dart';

class WeatherBox extends StatelessWidget {
  const WeatherBox({super.key});

  String getCurrentTime() {
    final now = DateTime.now();
    return DateFormat('h:mm a').format(now);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade200,
            border: Border(
              bottom: BorderSide(color: Colors.deepPurple.shade500, width: 2),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(10, 2, 2, 2),
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Weather ',
                style: GoogleFonts.jersey15(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: const Offset(2, 2),
                      blurRadius: 3,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ],
                ),
              ),

              Row(
                spacing: 5,
                children: [
                  DegreeButtons(degree: '°C'),
                  DegreeButtons(degree: '°F'),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: screenWidth,
          height: screenHeight * 0.739,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/weather_background_lightmode.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: screenWidth*0.4,
                height: screenHeight*0.4,
                child: Image.asset('assets/images/kitty_mascot.png'),
              ),
              Container(
                padding: EdgeInsetsGeometry.all(10),
                margin: EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(
                    color: Colors.deepPurpleAccent.shade100,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text("It's sunny today"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
