import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(NoWeatherState());
  WeatherModel? weatherModel;
  // ignore: non_constant_identifier_names
  GetWeather({required String City}) async {
    try {
      weatherModel =
          await WeatherService().GetCurrentWeather(city: City);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      String failure = 'Error fetching weather: $e';
      emit(WeatherFailureState(failure));
    }
  }
}
