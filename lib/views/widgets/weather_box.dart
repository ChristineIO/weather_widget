import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class WeatherBox extends StatelessWidget {
  const WeatherBox({super.key});

  String getCurrentTime() {
    final now = DateTime.now();
    return DateFormat('h:mm a').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 400,
          height: 400,
          padding: const EdgeInsets.all(20),
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
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
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
                Row(
                  spacing: 20,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      padding: const EdgeInsets.fromLTRB(25, 20, 45, 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(49, 167, 227, 255),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.water_drop,
                                color: Colors.blue.shade300,
                                size: 32,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Humidity',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '60%',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(width: 50),

                          Column(
                            children: [
                              Icon(
                                Icons.air,
                                color: Colors.grey.shade300,
                                size: 32,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Wind',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '15 mph',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(width: 50),

                          Column(
                            children: [
                              Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.deepOrange.shade400,
                                size: 32,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Visibility',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '10 mi',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(width: 5),                          
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
