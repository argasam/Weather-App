import 'package:flutter/cupertino.dart';
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
          Text("Temp(${type})", style: const TextStyle(fontSize: 15),),
          const SizedBox(height: cPadding/4,),
          Text("${temp} °C", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
        ],
      ),
    );
  }
}