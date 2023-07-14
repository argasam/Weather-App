import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/constant.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/view/home/components/function.dart';

class CardView extends StatefulWidget {
  final ListElement listofElement;

  const CardView({Key? key, required this.listofElement}) : super(key: key);

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  
  @override
  Widget build(BuildContext context) {
    ListElement listElement = widget.listofElement;
    double celc = toCelcius(300.15);
    return Container(
      color: Colors.blue,
      child: Row(
        children: [
          Image(image: NetworkImage('https://openweathermap.org/img/wn/${listElement.weather[0].icon}@2x.png')),
          Column(
            children: [
              Text((listElement.dtTxt).toString()),
              Text(listElement.weather[0].main),
              Text(toCelcius(listElement.main.temp).toStringAsFixed(1))
            ],
          )
        ],
      ),
    );
  }
}