import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

Future<Map<String, dynamic>> fetchApi() async {
  Position position = await Geolocator.getCurrentPosition(
    locationSettings: LocationSettings(accuracy: LocationAccuracy.best),
  );

  double lat = position.latitude;
  double lon = position.longitude;

  final url = Uri.parse(
    "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=5a63b569eddaaa872542222d90fe59bd",
  );
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data;
  } else {
    throw Exception('Failed to fetch weather data: ${response.statusCode}');
  }
}
