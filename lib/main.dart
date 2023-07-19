import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:weather_app/constant.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/view/home/home_view.dart';


void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
        ),
      ),
      home: const MainView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late Future<Map<String, dynamic>> _fetchWeatherData;

  static const api_KEY = String.fromEnvironment('API_KEYS');
  static const latitude_KEY = String.fromEnvironment("LATITUDE_KEYS");
  static const longitude_KEY = String.fromEnvironment("LONGITUDE_KEYS");

  @override
  void initState() {
    super.initState();
    _fetchWeatherData = fetchDataFromAPI();
  }

  Future<Map<String, dynamic>> fetchDataFromAPI() async {
    
    await Future.delayed(const Duration(seconds: 1));

    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?lat=${latitude_KEY}&lon=${longitude_KEY}&appid=${api_KEY}"));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      throw Exception('Request Failed with Response: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(
          title: const Text("Weather App"),
        ),
        body: FutureBuilder<Map<String, dynamic>>(
          future: _fetchWeatherData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: cPadding*2,),
                    Text("Fetcing Weather Data for Monas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final weatherData = ListWeather.fromJson(snapshot.data!);
              return HomeView(weatherData: weatherData);
            }
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}