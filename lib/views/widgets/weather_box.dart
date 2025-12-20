import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_widget/data/weather_info.dart';
import 'package:weather_widget/views/widgets/degree_buttons.dart';

class WeatherBox extends StatefulWidget {
  const WeatherBox({super.key});

  @override
  State<WeatherBox> createState() => _WeatherBoxState();
}

class _WeatherBoxState extends State<WeatherBox> {
  String getCurrentTime() {
    final now = DateTime.now();
    return DateFormat('h:mm a').format(now);
  }

  @override
  void initState() {
    super.initState();
    fetchWeatherOnLoad();
  }

  Map<String, dynamic>? weatherInfo;
  late String cityName;
  double tempKelvin = 274;
  double getCelsius = 0;
  double getFarenheit = 32;
  int tempCelsius = 0;
  int tempFarenheit = 32;

  late String weatherDescription; // few clouds

  late double windSpeed; // 4.78
  late int windDegree; // 179
  bool celsuis = true;
  Future<void> fetchWeatherOnLoad() async {
    try {
      final Map<String, dynamic> response = await fetchApi();

      setState(() {
        weatherInfo = response;
        cityName = weatherInfo?['name']; // Hartlepool
        tempKelvin = weatherInfo?['main']['temp']; // 278.74
        getCelsius = tempKelvin - 273.15; // Convert to °C
        getFarenheit = getCelsius * 9 / 5 + 32;
        tempCelsius = getCelsius.ceil();
        tempFarenheit = getFarenheit.ceil();

        weatherDescription =
            weatherInfo?['weather'][0]['description']; // few clouds

        windSpeed = weatherInfo?['wind']['speed']; // 4.78
        windDegree = weatherInfo?['wind']['deg']; // 179
      });
    } catch (e) {
      throw Exception("Error catching response $e");
    }
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
              Stack(
                children: [
                  Text(
                    'Weather ',
                    style: GoogleFonts.jersey15(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2.5
                        ..color = Colors.indigo.shade500,
                    ),
                  ),
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
                          color: Colors.black.withAlpha(150),
                        ),
                      ],
                    ),
                  ),
                ],
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
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: screenWidth * 0.25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple.shade900),
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(130, 255, 183, 218),
                  ),
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.fromLTRB(50, 0, 15, 25),

                  child: Stack(
                    children: [
                      // Outline
                      Text(
                        celsuis ? '$tempCelsius°C' : '$tempFarenheit°F',
                        style: GoogleFonts.unkempt(
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2.5
                            ..color = Colors.purple.shade800,
                        ),
                      ),

                      // Fill
                      Text(
                        celsuis ? '$tempCelsius°C' : '$tempFarenheit°F',
                        style: GoogleFonts.unkempt(
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: screenWidth * 0.35,
                margin: EdgeInsets.only(left: 15),
                child: Image.asset('assets/images/cat_mascot.png'),
              ),
              Container(
                padding: EdgeInsetsGeometry.all(8),
                margin: EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(
                    color: Colors.deepPurpleAccent.shade100,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: weatherInfo == null
                    ? const CircularProgressIndicator()
                    : Text(
                        "Hmmm... $weatherDescription today",
                        style: GoogleFonts.delius(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 28, 3, 78),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
