import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weatherCubit.dart';
import 'package:weather_app/cubits/weatherState.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:weather_app/pages/searchPage.dart';
import 'package:weather_app/logicCode/weatherService.dart';


class homePage extends StatelessWidget {

weatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.white24,
       title: Text('Weather App'),
       actions: [IconButton(onPressed:(){
            Navigator.push(context,MaterialPageRoute(builder: (context){
             return searchPage(

             );
            }));
       },
           icon: Icon(Icons.search),),],
     ),
      body:BlocBuilder<weatherCubit, weatherState>(
        builder: ( context, state) {
          if (state is weatherLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if(state is weatherSuccess){
           // weatherData = BlocProvider.of<weatherCubit>(context).weathermodel;
            return successBody(weatherData: state.weathermodel);
          }else if(state is weatherFailure) {
            return Container(
              color: Colors.white24,
              child: Center(
                child: Text('check your network and try again',
               style: TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.bold,
                 color: Colors.black26,
                ),),
              ),
            );
          } else {
           return Container(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('There is no weather start searching now 🔍',
                   style: TextStyle(
                     fontSize: 30,
                   ),
                   textAlign: TextAlign.center,
                 )
               ],
             ),
           );
          }
        },
      )
   );
  }
}

class successBody extends StatelessWidget {
  const successBody({
    super.key,
    required this.weatherData,
  });

  final weatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
      image: DecorationImage(
        image:  AssetImage('assets/images/homeBoackGround.jpg'),
        fit: BoxFit.cover,
      ),
        ),

          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
          Spacer(flex: 3,),

          Text(BlocProvider.of<weatherCubit>(context).cityName!,
          style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          ),
          ),
          Text(
          'Updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
          style: TextStyle(
          fontSize: 18
          ),),
          Spacer(flex: 1,),
          Card(
            color: Colors.white24,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Image.asset(weatherData!.getImage()),
            Text('${weatherData!.temp.toInt()}',
            style: TextStyle(
            fontSize: 24,
            // fontWeight: FontWeight.bold,
            ),
            ),
            Column(
            children: [
            Text('max Temprsure :${weatherData!.maxTemp.toInt()}' ),
            Text('min Temprsure :${weatherData!.minTemp.toInt()}'),
            ],
            ),

            ],
            ),
          ),
          Spacer(flex: 1,),
          Text(
          weatherData!.weatherStateName ,
          style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          ),
          ),
          Spacer(flex: 5,),

          ],
          ),
    );
  }
}
