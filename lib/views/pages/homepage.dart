import 'package:flutter/material.dart';
import 'package:weather_widget/views/widgets/weather_box.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: WeatherBox(),
      ),
    );
  }
}
