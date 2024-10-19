import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit.dart';
import 'package:weather/views/display_weather.dart';
import 'package:weather/views/home_page.dart';
import 'package:weather/views/search_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.amber
        ), // Applying dark theme here
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
