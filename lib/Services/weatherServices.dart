import 'dart:math';

import 'package:dio/dio.dart';
import 'package:weather/Model/weatherModel.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = "https://api.weatherapi.com/v1";
  final apiKey = "907b169fc7744e30b6d131447241510";

  WeatherServices(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
          "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1"
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage= e.response?.data['error']['message'] ??"oops there was an error! try later ";
      throw Exception(errorMessage);
    } catch(e) {
      print(e.toString());  // Use print here to log the error
      throw Exception("oops there was an error! try later");
    }
  }
}
