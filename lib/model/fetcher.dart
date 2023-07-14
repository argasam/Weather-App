
import 'dart:convert';

import 'package:weather_app/model/weather_model.dart';

Future<ListWeather> fetchData() async {
  return ListWeather.fromJson(jsonDecode('assets/mock-weather-data.json'));
}