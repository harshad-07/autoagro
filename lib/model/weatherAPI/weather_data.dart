
// import 'package:autoagro_draft/models/weatherAPI/current_weather_data.dart';
// import 'package:autoagro_draft/models/weatherAPI/daily_weather_data.dart';
// import 'package:autoagro_draft/models/weatherAPI/hourly_weather_data.dart';

import 'current_weather_data.dart';
import 'daily_weather_data.dart';
import 'hourly_weather_data.dart';

class WeatherData{

  final CurrentWeatherData? current;
  final HourlyWeatherData? hourly;
  final DailyWeatherData? daily;

  WeatherData({this.current, this.hourly, this.daily});

  CurrentWeatherData getCurrentWeatherData() => current!;
  HourlyWeatherData getHourlyWeatherData() => hourly!;
  DailyWeatherData getDailyWeatherData() => daily!;
  
}