import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getCurrentWeather(String city) async {
    Dio dio = Dio();
    String baseUrl = "http://api.weatherapi.com/v1/forecast.json";
    String apiKey = "254c7094f93b4f0ab6214517251910";
    try {
      Response jsondata = await dio.get(
        "${baseUrl}forecast.json?key=$apiKey&q=$city&days=1",
      );

      return WeatherModel.fromjson(jsondata.data);
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data["error"]["message"] ??
          "OOPS there was an error, try later";
      throw errorMessage;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to fetch weather');
    }
  }
}
