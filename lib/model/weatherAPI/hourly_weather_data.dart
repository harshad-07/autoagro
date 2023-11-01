
// import 'package:autoagro_draft/models/weatherAPI/weather.dart';

import 'weather.dart';

class HourlyWeatherData{
  List<Hourly> hourly;
  
  HourlyWeatherData({required this.hourly});

  factory HourlyWeatherData.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherData(
      hourly: List<Hourly>.from(json['hourly'].map((e)=>Hourly.fromJson(e))),
    );
  }

}

class Hourly {
  int? dt;
  double? temp;
  
  List<Weather>? weather;

  Hourly({
    this.dt,
    this.temp,
    
    this.weather,
    
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        dt: json['dt'] as int?,
        temp: (json['temp'] as num?)?.toDouble(),
        
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
            
      );

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'temp': temp,
        
        'weather': weather?.map((e) => e.toJson()).toList(),
        
      };
}
