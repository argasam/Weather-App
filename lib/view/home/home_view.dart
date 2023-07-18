import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/constant.dart';
import 'package:weather_app/model/fetcher.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/view/home/components/card.dart';
import 'package:weather_app/view/page/details_view.dart';

class HomeView extends StatefulWidget {

  final ListWeather weatherData;
  
  const HomeView({super.key, required this.weatherData});


  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  
  // var LATITUDE = "-6.175115064391812";
  // var LONGITUDE = "106.82708842419382";
  // var APIKEY = "a4b9b94e4d2e1882d33fff6d19b08eb1";
  // static const API_KEY = String.fromEnvironment('API_KEYS');
  // static const LATITUDE_KEY = String.fromEnvironment("LATITUDE_KEYS");
  // static const LONGITUDE_KEY = String.fromEnvironment("LONGITUDE_KEYS");
  
  // ListWeather? weatherData;
  // ListWeather? weatherDataAPI;

  // @override
  // void initState() {
  //   super.initState();
  //   fetchWeatherData();
  //   fetchWeatherDataAPI();
  // }

  // Future<void> fetchWeatherData() async {
  //   try {
  //     String jsonString = await rootBundle.loadString('assets/weather_data.json');
  //     Map<String, dynamic> json = jsonDecode(jsonString);
  //     setState(() {
  //       weatherData = ListWeather.fromJson(json);
  //     });
  //   } catch (error) {
  //     print('Error fetching weather data: $error');
  //   }
  // }

  // Future<void> fetchWeatherDataAPI() async {
  //   try {
  //     final response = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/forecast?lat=${LATITUDE_KEY}&lon=${LONGITUDE_KEY}&appid=${API_KEY}"));

  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> json = jsonDecode(response.body);
  //       setState(() {
  //         weatherDataAPI = ListWeather.fromJson(json);
  //       });
  //     }else{
  //       print('Request Failed with Response: ${response.statusCode}');
  //     }
      
  //   } catch (e) {
  //     print("Error: $e");
      
  //   }
    
  // }

  // Future<ListWeather> readJson() async {
  //   final String response = await rootBundle.loadString('assets/mock-weather-data.json');
  //   final weatherData = await ListWeather.fromJson(jsonDecode(response));
  //   return json.decode(response);
  // }
  
  @override
  Widget build(BuildContext context) {
    ListWeather weatherData= widget.weatherData;
    // var test = weatherData!.cod;
    return Scaffold(
        backgroundColor: Colors.white,
        body: weatherData != null ? 
        Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: weatherData!.list.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  // padding: EdgeInsets.symmetric(vertical: cPadding/4),
                  itemBuilder: ((context, index) {
                    ListElement listElement = weatherData!.list[index];
                    return CardView(
                      listofElement: listElement,
                      press: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: ((context) => DetailsView(listElement: listElement,))));
                      },);
                  }),
                  separatorBuilder: (context, index) {
                    return Container(
                      color: Colors.grey[300],
                      child: SizedBox(height: 2,),
                    );
                  },),
                  
                )
            ],
          ),
        )
        : Center(child: Column(
          children: [
            Text("Null"),
          ],
        ),)
    );
  }
}