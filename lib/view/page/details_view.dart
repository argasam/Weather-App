import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/constant.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/view/home/components/function.dart';
import 'package:weather_app/view/page/components/min_max_temp.dart';
import 'package:intl/intl.dart';

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
          title: Text("Weather Details"),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: cPadding/2),
                child: Column(
                  children: [
                    Text(DateFormat('EEE, MMMM dd, yyyy ').format(listElement.dtTxt).toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    Text(DateFormat('h:mm a').format(listElement.dtTxt).toString(), style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
              Container(
                height:150,
                color: Colors.blue,
                padding: EdgeInsets.all(cPadding/4),
                margin: EdgeInsets.only(bottom: cPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(toCelcius(listElement.main.temp).toStringAsFixed(1) + "°C",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
                    Image(image: NetworkImage('https://openweathermap.org/img/wn/${listElement.weather[0].icon}@2x.png'),)
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                  children: [
                    TextSpan(text: listElement.weather[0].main.toString()),
                    TextSpan(text: " ("),
                    TextSpan(text: listElement.weather[0].description),
                    TextSpan(text: ")")
                  ]
                )),
              SizedBox(height: cPadding+5,),
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