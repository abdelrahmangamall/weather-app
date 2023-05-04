import 'package:weather_app/models/weatherModel.dart';

abstract class weatherState{}

class weatherInitial extends weatherState{}
class weatherLoading extends weatherState{}
class weatherSuccess extends weatherState{
  weatherModel weathermodel;
  weatherSuccess({required this.weathermodel});
}
class weatherFailure extends weatherState{}