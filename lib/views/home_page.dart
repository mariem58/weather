import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_states.dart';
import 'package:weather/views/display_weather.dart';
import 'package:weather/views/no_weather.dart';
import 'package:weather/views/search_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffde049d),
        title: Text(
          "Weather App",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchView()));
            },
            icon: Icon(Icons.search,size: 30,color: Colors.white,),
          ),
        ],
      ),
      body:  BlocBuilder<GetWeatherCubit,WeatherState>(
          builder: (context,state){
            if(state is NoWeatherState){
              return NoWeather();
            }else if(state is WeatherLoadedState){
              return DisplayWeather();
            }else{
              return Text("oops there was an error");
            }
          },
      ),
    );
  }
}
