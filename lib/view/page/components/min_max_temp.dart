import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/constant.dart';

class MinMax extends StatelessWidget {
  final String type;
  final String temp;

  const MinMax({super.key, required this.type, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Temp(${type})", style: TextStyle(fontSize: 15),),
          SizedBox(height: cPadding/4,),
          Text(temp, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
        ],
      ),
    );
  }
}