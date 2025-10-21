import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<GetWeatherCubit>(context);

          // Pick the theme color based on the weather condition
          final MaterialColor themeColor = getWeatherThemeColor(
            cubit.bodyWeatherModel?.weatherCondition,
          );

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: themeColor,
              appBarTheme: AppBarTheme(
                backgroundColor: themeColor,
                foregroundColor: Colors.white,
              ),
            ),
            home: HomeView(),
          );
        },
      ),
    );
  }
}

MaterialColor getWeatherThemeColor(String? day) {
  if (day == null) {
    return Colors.teal;
  }
  switch (day) {
    case "Sunny":
      return Colors.orange;
    case "Clear":
      return Colors.indigo;
    case "Partly cloudy":
      return Colors.lightBlue;
    case "Cloudy":
    case "Overcast":
      return Colors.blueGrey;
    case "Mist":
    case "Fog":
    case "Freezing fog":
      return Colors.grey;
    case "Patchy rain possible":
    case "Patchy light rain":
    case "Light rain":
    case "Light rain shower":
      return Colors.blue;
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
      return Colors.indigo;
    case "Patchy snow possible":
    case "Light snow":
    case "Patchy light snow":
    case "Moderate snow":
    case "Heavy snow":
    case "Patchy moderate snow":
    case "Patchy heavy snow":
    case "Moderate or heavy snow showers":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.cyan;
    case "Blowing snow":
    case "Blizzard":
      return Colors.lightBlue;
    case "Patchy sleet possible":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
      return Colors.teal;
    case "Patchy freezing drizzle possible":
    case "Patchy light drizzle":
    case "Light drizzle":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
      return Colors.lightBlue;
    case "Thundery outbreaks possible":
      return Colors.deepPurple;
    case "Ice pellets":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.lightBlue;
    default:
      return Colors.teal;
  }
}
