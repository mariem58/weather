import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit.dart';

import '../Model/weatherModel.dart';

class DisplayWeather extends StatelessWidget {
  const DisplayWeather({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel=BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              weatherModel.city,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(
            "update at ${weatherModel.update.hour}:${weatherModel.update.minute}",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network("https:${weatherModel.image}"),

              Text(weatherModel.temp.toString()),
              Column(
                children: [
                  Text(
                    "maxTemp :${weatherModel.maxTemp.round()}",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "minTemp :${weatherModel.minTemp.round()}",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            weatherModel.weatherCondition,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
    );
  }
}
