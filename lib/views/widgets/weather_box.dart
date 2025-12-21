import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_widget/data/temp_state.dart';
import 'package:weather_widget/data/weather_info.dart';

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
  bool celsius = true; // Changed from static to instance variable
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
          width: screenWidth,
          height: screenHeight * 0.8595,
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
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bubble_indigo.png"),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  margin: const EdgeInsets.fromLTRB(50, 0, 15, 25),
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.2,
                  child: Stack(
                    children: [
                      ValueListenableBuilder<bool>(
                        valueListenable: isCelsuis,
                        builder: (context, value, child) {
                          return Stack(
                            children: [
                              // Outline
                              Text(
                                isCelsuis.value
                                    ? '$tempCelsius°C'
                                    : '$tempFarenheit°F',
                                style: GoogleFonts.unkempt(
                                  fontSize: screenWidth * 0.055,
                                  fontWeight: FontWeight.w700,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 2.5
                                    ..color = Color.fromARGB(255, 11, 3, 72)
                                ),
                              ),

                              // Fill
                              Text(
                                isCelsuis.value
                                    ? '$tempCelsius°C'
                                    : '$tempFarenheit°F',
                                style: GoogleFonts.unkempt(
                                  fontSize: screenWidth * 0.055,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey.shade100,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 5,
                  ),
                  width: screenWidth * 0.5,
                      child: Text(
                        cityName,
                        style: GoogleFonts.tiny5(
                          fontSize: 33,
                          fontWeight: FontWeight.w800,
                          color: Colors.indigo.shade50,
                        ),
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
                    color: Colors.indigo.shade300,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: weatherInfo == null
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Hmmm... ",
                            style: GoogleFonts.delius(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 12, 3, 78),
                            ),
                          ),
                          const SizedBox(width: 6),
                          const SizedBox(
                            width: 14,
                            height: 14,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                          Text(
                            " today",
                            style: GoogleFonts.delius(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 12, 3, 78),
                            ),
                          ),
                        ],
                      )
                    : Text(
                        "Hmmm... $weatherDescription today",
                        style: GoogleFonts.delius(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 12, 3, 78),
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
