import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/constant.dart';
import 'package:weather_app/view/page/components/min_max_temp.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                    Text("Date",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text("Jam",style: TextStyle(fontSize: 20),),
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
                    Text("Temp",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
                    Image(image: NetworkImage('https://openweathermap.org/img/wn/02d@2x.png'),)
                  ],
                ),
              ),
              Text("Main(Description)",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(height: cPadding+5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MinMax(type: "min"),
                  MinMax(type: "max")
                ],
              )
            ],
          ),
        ),
        ),

    );
  }
}