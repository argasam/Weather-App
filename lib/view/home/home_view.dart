import 'dart:convert';

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
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ListWeather? weatherData;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    try {
      String jsonString = await rootBundle.loadString('assets/weather_data.json');
      Map<String, dynamic> json = jsonDecode(jsonString);
      setState(() {
        weatherData = ListWeather.fromJson(json);
      });
    } catch (error) {
      print('Error fetching weather data: $error');
    }
  }

  // Future<ListWeather> readJson() async {
  //   final String response = await rootBundle.loadString('assets/mock-weather-data.json');
  //   final weatherData = await ListWeather.fromJson(jsonDecode(response));
  //   return json.decode(response);
  // }
  
  @override
  Widget build(BuildContext context) {
    // var test = weatherData!.cod;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
           "Weather App"),
        ),

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
                      color: Colors.black,
                      child: SizedBox(height: 2,),
                    );
                  },),
                  
                )
            ],
          ),
        )
        : Center(child: Column(
          children: [
            Text("Null")
          ],
        ),)
        ),
    );
  }
}