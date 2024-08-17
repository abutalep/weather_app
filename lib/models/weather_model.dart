class WeatherModel {
  String city, weatherCondition;
  DateTime date;
  String? image;
  double temp, maxtemp, mintemp;
  WeatherModel(
      {required this.city,
      required this.date,
      this.image,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherCondition});
  factory WeatherModel.fromjson(json) {
    return WeatherModel(
      city: json["location"]["name"],
      date: DateTime.parse(json["current"]["last_updated"]),
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxtemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      mintemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      weatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
    );
  }
}
