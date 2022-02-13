abstract class WeatherStates {}

class WeatherInitialState extends WeatherStates {}

class GetWeatherDataLoadingState extends WeatherStates {}

class GetWeatherDataSuccessState extends WeatherStates {}

class GetWeatherDataErrorState extends WeatherStates {}

class ChangeIndexState extends WeatherStates {}
