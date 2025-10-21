import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: const Text(
          'Search City',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        shadowColor: Colors.black54,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              await BlocProvider.of<GetWeatherCubit>(
                context,
              ).getWeather(cityName: value);
              Navigator.pop(context);
            },

            decoration: InputDecoration(
              hintText: 'Enter city name',
              suffixIcon: Icon(Icons.search),
              labelText: 'Search',

              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2.0, color: Colors.green),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
