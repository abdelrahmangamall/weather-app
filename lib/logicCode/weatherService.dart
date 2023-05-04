 import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weatherModel.dart';

class weatherService {
String baseUrl= 'http://api.weatherapi.com/v1';
String apiKey = 'key=2817409ae0854b1b8c844744231504';

  Future<weatherModel?> getWeather({required String cityName})
 async {
   weatherModel? weather;
  try{
    Uri url =Uri.parse(
        '$baseUrl/forecast.json?$apiKey&q=$cityName&days=7');
    http.Response response =await http.get(url);
    Map<String,dynamic> data = jsonDecode(response.body);
     weather = weatherModel.fromJson(data);

  } catch(e){
    print(e);
  }
      return weather;
  }
}