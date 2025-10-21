import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    final weather = context.read<GetWeatherCubit>().bodyWeatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getWeatherThemeColor(weather.weatherCondition),
            getWeatherThemeColor(weather.weatherCondition).shade200,
            getWeatherThemeColor(weather.weatherCondition).shade50,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weather.city,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            Text(
              'updated at ${weather.date.hour}:${weather.date.minute}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Weather icon
                Image.network("https:${weather.image}"),

                // Temperature
                Text(
                  weather.temp,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),

                // Min/Max column (flexible width)
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Maxtemp: ${weather.maxTemp}",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Mintemp: ${weather.minTemp}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 32),
            Text(
              weather.weatherCondition,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
