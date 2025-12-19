import 'package:flutter/material.dart';


class ScreenSize extends InheritedWidget {
  final double width;

  const ScreenSize({
    super.key,
    required this.width,
    required super.child,
  });

  static ScreenSize of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ScreenSize>()!;
  }

  @override
  bool updateShouldNotify(ScreenSize oldWidget) =>
      width != oldWidget.width;
}

