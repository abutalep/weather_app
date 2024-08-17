import 'package:weather_app/models/weather_model.dart';

class WeatherStates {
}

//InitialState
class NoWeatherState extends WeatherStates {
}

class WeatherLoadedState extends WeatherStates {
  final WeatherModel weatherModel;
  WeatherLoadedState(this.weatherModel);
}

class WeatherFailureState extends WeatherStates {
  final String failure;
  WeatherFailureState(this.failure);
}
