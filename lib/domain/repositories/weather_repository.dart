import 'package:dio/dio.dart';
import 'package:simple_weather/domain/models/weather_model.dart';

class WeatherRepository {
  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    final response = await Dio().get<Map<String, dynamic>>(
        'http://api.weatherapi.com/v1/current.json?key=6e84c9c1019e4231880195208231406&q=$city&aqi=no');
    final responseData = response.data;
    if (responseData == null) {
      return null;
    }
    final name = responseData['location']['name'] as String;
    final temperature = responseData['current']['temp_c'] as double;
    return WeatherModel(city: name, temperature: temperature);
  }
}
