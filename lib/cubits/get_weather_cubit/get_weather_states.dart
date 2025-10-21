import 'package:flutter/widgets.dart';

class WeatherState {}

class NoWeatherState extends WeatherState {
  Widget noInfoFunction() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(fontSize: 30),
            ),
            Text('searching now 🔍', style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}

class LoadedWeatherState extends WeatherState {}

class WeatherFailureState extends WeatherState {
  final String? errorMessage;
  WeatherFailureState({required this.errorMessage});
}
