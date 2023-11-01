import 'dart:convert';

// import 'package:autoagro_draft/api/api_key.dart';
// import 'package:autoagro_draft/models/weatherAPI/current_weather_data.dart';
// import 'package:autoagro_draft/models/weatherAPI/daily_weather_data.dart';
// import 'package:autoagro_draft/models/weatherAPI/hourly_weather_data.dart';
// import 'package:autoagro_draft/models/weatherAPI/weather_data.dart';
import 'package:http/http.dart' as http;

import '../model/weatherAPI/current_weather_data.dart';
import '../model/weatherAPI/daily_weather_data.dart';
import '../model/weatherAPI/hourly_weather_data.dart';
import '../model/weatherAPI/weather_data.dart';
import 'api_key.dart';

class FetchWeatherAPI{

  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(
      Uri.parse(apiURL(lat, lon)),
    );
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(current: CurrentWeatherData.fromJson(jsonString), hourly: HourlyWeatherData.fromJson(jsonString), daily: DailyWeatherData.fromJson(jsonString));
    return weatherData!;
  }

}


String apiURL(var lat, var lon){
  String url = "https://api.openweathermap.org/data/3.0/onecall?exclude=minutely&lat=$lat&lon=$lon&appid=$apiKey&units=metric";
  return url;
}