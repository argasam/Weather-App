import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:weather_app/constant.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/view/home/components/function.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:ui' as ui;

class CardView extends StatefulWidget {
  final ListElement listofElement;
  final VoidCallback press;
  

  const CardView({
    Key? key, 
    required this.listofElement, 
    required this.press
  }) : super(key: key);

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  


  @override
  Widget build(BuildContext context) {
    ListElement listElement = widget.listofElement;
    VoidCallback press = widget.press;
    
    return GestureDetector(
      onTap: press,
      child: Container(
        
        child: Row(
          children: [
            Container(
              height: 100, width: 100,
              child: 
              FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: 'https://openweathermap.org/img/wn/${listElement.weather[0].icon}@2x.png',)
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black
                    ),
                    children: [
                      TextSpan(text: DateFormat('EEE, MMMM dd, yyyy ').format(listElement.dtTxt).toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: DateFormat('h:mm a').format(listElement.dtTxt).toString()),
                    ]
                  )),
                // Text(DateFormat('EEE, MMMM dd, yyyy h:mm a').format(listElement.dtTxt).toString()),
                Text(listElement.weather[0].main),
                Text("Temp: " + toCelcius(listElement.main.temp).toStringAsFixed(1) + "°C")
              ],
            )
          ],
        ),
      ),
    );
  }
}