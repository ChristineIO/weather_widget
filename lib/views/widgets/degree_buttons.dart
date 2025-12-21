import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DegreeButtons extends StatelessWidget {
  const DegreeButtons({super.key, required this.degree});
  final String degree;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepPurple.shade400),
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(130, 255, 251, 251),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          child: Text(
            degree,
            style: GoogleFonts.jersey15(fontSize: 16, color: Colors.white),
            
          ),
        ),
      ],
    );
  }
}
