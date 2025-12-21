import 'package:flutter/material.dart';
import 'package:weather_widget/views/pages/homepage.dart';
import 'package:weather_widget/views/widgets/app_bar.dart';
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
      appBar: const MyAppBar(),
      body: pages[0],
    );
  }
}
