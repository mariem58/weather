import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Model/weatherModel.dart';
import 'package:weather/cubits/get_weather_states.dart';
import '../Services/weatherServices.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());

  late WeatherModel weatherModel;

  // Function to get weather by city name
  Future<void> getWeather({required String cityName}) async {
    try {
      emit(WeatherLoadingState()); // Indicate that loading has started
      weatherModel = await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel)); // Pass the WeatherModel to the state
    } catch (e) {
      emit(WeatherFailureState(error: e.toString())); // Pass the error if any
    }
  }
}
