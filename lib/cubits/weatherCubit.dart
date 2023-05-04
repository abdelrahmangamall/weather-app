import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weatherState.dart';
import 'package:weather_app/logicCode/weatherService.dart';
import 'package:weather_app/models/weatherModel.dart';

class weatherCubit extends Cubit<weatherState> {
       weatherCubit(this.weatherservice) : super(weatherInitial());
       String? cityName;
       weatherModel?  weathermodel;
       weatherService weatherservice;
       void getWeather({required String cityName}) async{
         emit(weatherLoading());
         try {
           weathermodel =
           await  weatherservice.getWeather(cityName: cityName);
           emit(weatherSuccess( weathermodel: weathermodel!));
         } catch (e) {
           print(e);
           emit(weatherFailure());
         }
       }
  }











