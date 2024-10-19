class WeatherModel{
  final String city;
  final DateTime update;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;
  final double temp;
  final String image;

      WeatherModel(
          {
        required this.update,
        required this.maxTemp,
        required this.minTemp,
        required this.weatherCondition,
        required this.temp,
        required this.city, 
        required this.image,
          }
          );
      factory WeatherModel.fromJson(json){
        return WeatherModel(
            update: DateTime.parse(json["current"]["last_updated"]),
            maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
            minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
            weatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
            temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
            city: json["location"]["name"],
          image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
        );
      }

}