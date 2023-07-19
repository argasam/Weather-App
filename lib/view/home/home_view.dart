import 'package:flutter/material.dart';
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
                      child: const SizedBox(height: 2,),
                    );
                  },),
                  
                )
            ],
          ),
        )
        : const Center(child: Column(
          children: [
            Text("Null"),
          ],
        ),)
    );
  }
}