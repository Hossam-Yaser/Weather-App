import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  WeatherModel? bodyWeatherModel;
  Future<void> getWeather({required String cityName}) async {
    try {
      bodyWeatherModel = await WeatherService().getCurrentWeather(cityName);
      emit(LoadedWeatherState());
    } catch (e) {
      emit(WeatherFailureState(errorMessage: e.toString()));
    }
  }
}
