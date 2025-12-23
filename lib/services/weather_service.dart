import 'dart:async';
import 'package:weather_widget/data/weather_info.dart';

class WeatherService {
  Stream<Map<String, dynamic>> get weatherStream =>
      Stream.periodic(
        const Duration(minutes: 10), // adjust as needed
        (_) => fetchApi(),
      ).asyncMap((event) async => await event);
}