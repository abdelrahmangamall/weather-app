import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class weatherModel {
  String weatherStateName;
  double temp, maxTemp, minTemp;
  DateTime date;

  @override
  String toString() {
    return 'tem=$temp   mintem=$minTemp avgtem=$temp  maxtmp=$maxTemp weathStatName=$weatherStateName Date=$date';
  }

  weatherModel({required this.date,
    required this.weatherStateName,
    required this.temp,
    required this.maxTemp,
    required this.minTemp});

  factory weatherModel.fromJson(dynamic data){
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return weatherModel(

        date: DateTime.parse(data['location']['localtime']),
        weatherStateName: jsonData['condition']['text'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c']);
  }

  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' || weatherStateName == 'Snow'
        || weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else
    if (weatherStateName == 'Light Rain' || weatherStateName == 'Heavy Rain'
        || weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Heavy Cloudy') {
      return 'assets/images/cloudy.png';
    } else
    if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
}
