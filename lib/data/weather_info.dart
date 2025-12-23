import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

Future<Map<String, dynamic>> fetchApi() async {
  double lat;
  double lon;

  bool mockLocation = kDebugMode;

  if (!mockLocation) {
    lat = 53.2232;
    lon = -4.200;
  } else {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw Exception('Location permission denied');
    }

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.best),
    );

    lat = position.latitude;
    lon = position.longitude;
    print('Location: $lat, $lon, Permission: $permission');
  }
  final url = Uri.parse(
    "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=5a63b569eddaaa872542222d90fe59bd",
  );
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print(data);
    return data;
  } else {
    throw Exception('Failed to fetch weather data: ${response.statusCode}');
  }
}
