import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weatherCubit.dart';
import 'package:weather_app/logicCode/weatherService.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:weather_app/pages/homePage.dart';

void main() {
  runApp(  BlocProvider(
      create: (context) {
        return weatherCubit(weatherService());
      },
      child: weatherApp()));
}

class weatherApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
            home: homePage(),
      );
  }
}

