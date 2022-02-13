import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/cubit.dart';
import 'package:weather_app/bloc/states.dart';

class SecondScreen extends StatelessWidget {
  //don't need tp pass it just call it by cubit
  // late String title;
  // SecondScreen({required this.title});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = WeatherCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Image(
                image: NetworkImage(
                  "https://ak.picdn.net/shutterstock/videos/1019313310/thumb/1.jpg",
                ),
              ),
              Text(
                cubit.weatherData!.title!,
                // anthor solution
                // cubit.weatherdata[0].title!, // to see this work too remove comment of line 34 in cubit don't forget!!!
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "sun",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "19 C",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
