class WeatherModel {
  final String city;
  final DateTime date;
  final String? image;
  final String temp;
  final String minTemp;
  final String maxTemp;
  final String weatherCondition;

  WeatherModel({
    required this.date,
    this.image,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.city,
    required this.weatherCondition,
  });

  factory WeatherModel.fromjson(json) {
    return WeatherModel(
      city: json["location"]["name"],
      date: DateTime.parse(json["location"]["localtime"]),
      temp: json["current"]["temp_c"].toString(),
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"]
          .round()
          .toString(),
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"]
          .round()
          .toString(),
      weatherCondition:
          json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
    );
  }
}
