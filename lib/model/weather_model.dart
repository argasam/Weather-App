import 'dart:convert';
import 'package:weather_app/model/enum.dart';

ListWeather welcomeFromJson(String str) => ListWeather.fromJson(json.decode(str));

String welcomeToJson(ListWeather data) => json.encode(data.toJson());

// Main File
class ListWeather {

  final String cod;
  final List<ListElement> list;
  final City city;

  ListWeather({
    required this.cod,
    required this.list,
    required this.city
  });

  factory ListWeather.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List<dynamic>;
    List<ListElement> elements = list
      .map((element) => ListElement.fromJson(element))
      .toList();

    return ListWeather(
      cod: json['cod'],
      list: elements,
      city: City.fromJson(json['city']),
    );

  }

  Map<String, dynamic> toJson() => {
    "cod": cod,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
    "city": city.toJson(),
  };
}

// List of Forecast 
class ListElement {
    int dt;
    MainClass main;
    List<Weather> weather;
    Clouds clouds;
    Wind wind;
    int visibility;
    double pop;
    Rain? rain;
    Sys sys;
    DateTime dtTxt;

    ListElement({
        required this.dt,
        required this.main,
        required this.weather,
        required this.clouds,
        required this.wind,
        required this.visibility,
        required this.pop,
        this.rain,
        required this.sys,
        required this.dtTxt,
    });

    factory ListElement.fromJson(Map<String, dynamic> json) {
      var weatherList = json['weather'] as List<dynamic>;
      List<Weather> weatherElements = weatherList
          .map((weatherJson) => Weather.fromJson(weatherJson))
          .toList();

      return ListElement(
        dt: json["dt"],
        main: MainClass.fromJson(json["main"]),
        weather: weatherElements,
        clouds: Clouds.fromJson(json["clouds"]),
        wind: Wind.fromJson(json["wind"]),
        visibility: json["visibility"],
        pop: double.parse(json["pop"].toString()),
        rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
        sys: Sys.fromJson(json["sys"]),
        dtTxt: DateTime.parse(json["dt_txt"]),
      );
    }

    Map<String, dynamic> toJson() => {
      "dt": dt,
      "main": main.toJson(),
      "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
      "clouds": clouds.toJson(),
      "wind": wind.toJson(),
      "visibility": visibility,
      "pop": pop,
      "rain": rain?.toJson(),
      "sys": sys.toJson(),
      "dt_txt": dtTxt.toIso8601String(),
    };
}

class Sys {
  Pod pod;

  Sys({
      required this.pod,
  });
  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
      pod: podValues.map[json["pod"]]!,
  );
  Map<String, dynamic> toJson() => {
      "pod": podValues.reverse[pod],
  };
}

class Rain {
  double the3H;

    Rain({
        required this.the3H,
    });

    factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the3H: double.parse(json["3h"].toString())
    );

    Map<String, dynamic> toJson() => {
        "3h": the3H,
    };
}

class Wind {
  double speed;
  int deg;
  double gust;

    Wind({
        required this.speed,
        required this.deg,
        required this.gust,
    });

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: double.parse(json["speed"].toString()),
        deg: json["deg"],
        gust: double.parse(json["gust"].toString()),
    );

    Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
    };
}

class Clouds {
    int all;

    Clouds({
        required this.all,
    });

    factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
    };
}

class Weather {
    int id;
    String main;
    String description;
    String icon;

    Weather({
        required this.id,
        required this.main,
        required this.description,
        required this.icon,
    });

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
    };
}

class MainClass {
    double temp;
    double feelsLike;
    double tempMin;
    double tempMax;
    int pressure;
    int seaLevel;
    int grndLevel;
    int humidity;
    double tempKf;

    MainClass({
        required this.temp,
        required this.feelsLike,
        required this.tempMin,
        required this.tempMax,
        required this.pressure,
        required this.seaLevel,
        required this.grndLevel,
        required this.humidity,
        required this.tempKf,
    });

    factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
        temp: double.parse(json["temp"].toString()),
        feelsLike: double.parse(json["feels_like"].toString()),
        tempMin: double.parse(json["temp_min"].toString()),
        tempMax: double.parse(json["temp_max"].toString()),
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: double.parse(json["temp_kf"].toString()),
    );

    Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf,
    };
}

class City{
  final int id;
  final String name;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  City({
        required this.id,
        required this.name,
        required this.country,
        required this.population,
        required this.timezone,
        required this.sunrise,
        required this.sunset,
    });

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
    };
}
