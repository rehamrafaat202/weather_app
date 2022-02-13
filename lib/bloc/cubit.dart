import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/states.dart';
import 'package:weather_app/dio_helper/dio_helper.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialState());

  static WeatherCubit get(context) => BlocProvider.of(context);

  // var index = 0;

  // void changeIndex(index) {
  //   index = index;                 // wrong  you don't need to change index
  //   emit(ChangeIndexState());
  // }

  WeatherData? weatherData; // object of weatherModel
  List<WeatherData> weatherdata = [];
  getWeatherData() {
    emit(GetWeatherDataLoadingState());
    DioHelper.getData(
      url: "api/location/search/",
      query: {
        "query": "cairo",
        "latt_long": "latt_long",
      },
    ).then((value) {
      print(value.data);
      // you must use forEach cause the data is list of objects
      value.data.forEach((value) {
        weatherData = WeatherData.fromJson(
            value); // here you fill the object and can use it now

        // weatherdata.add(weatherData!); // use this to add to the list === example: line 36
      });
      // print(weatherData!); // to retrive only one object
      // print(weatherdata[0].title); // anthor solution if you want to retrive a list

      // weatherdata = value.data["query"]; //wrong
      emit(GetWeatherDataSuccessState());
    }).catchError((error) {
      print("eeeeee ${error}");
      emit(GetWeatherDataErrorState());
    });
  }
}
