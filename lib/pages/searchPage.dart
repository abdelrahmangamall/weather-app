import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weatherCubit.dart';
import 'package:weather_app/logicCode/weatherService.dart';
import 'package:weather_app/models/weatherModel.dart';

class searchPage extends StatelessWidget{
String? cityname;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Search a City',
        style: TextStyle(
          color: Colors.black
        ),),
       // toolbarOpacity: 50,
      ),
     body:  Container(
       padding: const EdgeInsets.symmetric(horizontal: 15),
       decoration: BoxDecoration(
       image: DecorationImage(
       image: AssetImage('assets/images/backGround.jpg'),
         fit: BoxFit.cover,
       ),
       ),
       child: Center(
         child: Card(
           child: TextField(

             onChanged: (data) async {
               cityname=data;
             },
             onSubmitted: (data) async {
               cityname=data;
             BlocProvider.of<weatherCubit>(context)
                 .getWeather(cityName: cityname!);
               BlocProvider.of<weatherCubit>(context).cityName=cityname;
             Navigator.pop(context);
             },
               decoration: InputDecoration(
                 contentPadding: EdgeInsets.symmetric(horizontal: 18,vertical: 35),
               border: OutlineInputBorder(),
               hintText: 'Enter your City ',
               label: Text('Search',
               style: TextStyle(
                 color: Colors.black
               ),),
               suffixIcon: GestureDetector(
                   onTap:() async {
                     weatherService service = weatherService();

                     weatherModel? weather =
                         await service.getWeather(cityName: cityname!);
                     Navigator.pop(context);
                   },
                 child:  Icon(Icons.search,
                 color: Colors.black,)),
             ),

           ),
         ),
       ),
     ),
   );
   }
  }
  