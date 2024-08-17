import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String api = "get your api from https://www.weatherapi.com/";
  // ignore: non_constant_identifier_names
  Future<WeatherModel> GetCurrentWeather({required String city}) async {
    try {
      Response response =
          await Dio().get('$baseUrl/forecast.json?key=$api&q=$city&days=1');
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]["message"] ??
          "oops!there was an error , try later";
      throw Exception(errorMessage);
    }
  }
}
