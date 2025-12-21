import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_widget/data/temp_state.dart';
import 'package:weather_widget/views/widgets/degree_buttons.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            // Left-aligned title
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
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ValueListenableBuilder<bool>(
                    valueListenable: isCelsuis,
                    builder: (context, celsius, _) {
                      return Row(
                        children: [
                          InkWell(
                            onTap: () => isCelsuis.value = true,
                            child: const DegreeButtons(degree: '°C'),
                          ),
                          const SizedBox(width: 6),
                          InkWell(
                            onTap: () => isCelsuis.value = false,
                            child: const DegreeButtons(degree: '°F'),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
