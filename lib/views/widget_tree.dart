import 'package:flutter/material.dart';

import 'package:weather_widget/views/pages/homepage.dart';

List<Widget> pages = const [Homepage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[0],
    );
  }
}
