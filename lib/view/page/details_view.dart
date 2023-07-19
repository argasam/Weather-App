import 'package:flutter/material.dart';
import 'package:weather_app/constant.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/view/home/components/function.dart';
import 'package:weather_app/view/page/components/min_max_temp.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailsView extends StatefulWidget {
  final ListElement listElement;

  const DetailsView({
    Key? key, 
    required this.listElement, 
  }) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  
  @override
  Widget build(BuildContext context) {
    ListElement listElement = widget.listElement;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Weather Details"),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: cPadding/2),
                child: Column(
                  children: [
                    const SizedBox(height: 10/2,),
                    Text(DateFormat('EEEEE, MMMM dd, yyyy ').format(listElement.dtTxt).toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    Text(DateFormat('h:mm a').format(listElement.dtTxt).toString(), style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
              Container(
                height:150,
                padding: const EdgeInsets.all(cPadding/10),
                // margin: EdgeInsets.only(bottom: cPadding),
                child: Container(
                  padding: const EdgeInsets.all(10),  
                  // color: Colors.blueAccent,
                  width: MediaQuery.of(context).size.width/5*4,
                  child: Stack(
                    alignment: Alignment.center,
                    
                    children: [
                      Positioned(
                        left: 10,
                        child: Text("${toCelcius(listElement.main.temp).toStringAsFixed(1)} °C",
                        style: const TextStyle(fontSize: 50),),
                      ),
                      Positioned(
                        right: 1,
                        top: 10,
                        child: Container(
                          
                          child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: 'https://openweathermap.org/img/wn/${listElement.weather[0].icon}@2x.png',),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                  children: [
                    TextSpan(text: listElement.weather[0].main.toString()),
                    const TextSpan(text: " ("),
                    TextSpan(text: listElement.weather[0].description),
                    const TextSpan(text: ")")
                  ]
                )),
              const SizedBox(height: cPadding*2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MinMax(type: "min", temp: toCelcius(listElement.main.tempMin).toStringAsFixed(1),),
                  MinMax(type: "max", temp: toCelcius(listElement.main.tempMax).toStringAsFixed(1),)
                ],
              )
            ],
          ),
        ),
      );

  }
}