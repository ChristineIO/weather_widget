import 'package:flutter/material.dart';
import 'package:weather_widget/data/temp_state.dart';
import 'package:weather_widget/views/pages/homepage.dart';
import 'package:weather_widget/views/widgets/degree_buttons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_widget/views/widgets/weather_box.dart';

List<Widget> pages = const [Homepage()];

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  final tempState = WeatherBox();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade200,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Container(height: 2, color: Colors.deepPurple.shade500),
        ),
        title: SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Stack(
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
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ValueListenableBuilder<bool>(
                    valueListenable: isCelsuis,
                    builder: (context, celsius, _) {
                      return Row(
                        children: [
                          InkWell(
                            onTap: () => setState(() {
                              isCelsuis.value = true;
                            }),
                            child: const DegreeButtons(degree: '°C'),
                          ),
                          const SizedBox(width: 6),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isCelsuis.value = !isCelsuis.value;
                              });
                            },
                            child: const DegreeButtons(degree: '°F'),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      body: pages[0],
    );
  }
}
