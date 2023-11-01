// import 'package:autoagro_draft/models/weatherAPI/current_weather_data.dart';
// import 'package:autoagro_draft/screens/weather/utils/custom_colors.dart';
import 'package:flutter/material.dart';

import '../../../model/weatherAPI/current_weather_data.dart';
import '../utils/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {

  // double wind_speed = data.current.windSpeed! * 1.6;
  
  final CurrentWeatherData data;

  const CurrentWeatherWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 18,),
        tempWidget(),
        SizedBox(height: 18,),
        moreCurrentWeatherDetailsWidget(),
      ],
    );
  }
  
  Widget tempWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset('assets/weather_images/${data.current.weather![0].icon}.png', height: 80, width: 80),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Container(height: 50, width: 1, color: CustomColors.dividerLine,),
        ),
        RichText(text: TextSpan(
          text: "${data.current.temp!.round()}°",
          style: TextStyle(color: Colors.black87, fontSize: 69, fontWeight: FontWeight.w500) 
        )),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: RichText(text: TextSpan(
            text: "${data.current.weather![0].description}",
            style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w300) 
          )),
        )
      ],
    );
  }
  
  Widget moreCurrentWeatherDetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60, 
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Image.asset('assets/icons/windspeed.png'),
            ),
            Container(
              height: 60, 
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Image.asset('assets/icons/clouds.png'),
            ),
            Container(
              height: 60, 
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Image.asset('assets/icons/humidity.png'),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 20, width: 69,child: Text("${(data.current.windSpeed! * 1.6).toStringAsFixed(2)} km/h", style: TextStyle(fontSize: 12), textAlign: TextAlign.center,)),
            SizedBox(height: 20, width: 60,child: Text("${data.current.clouds}%", style: TextStyle(fontSize: 12), textAlign: TextAlign.center,)),
            SizedBox(height: 20, width: 60,child: Text("${data.current.humidity}%", style: TextStyle(fontSize: 12), textAlign: TextAlign.center,)),

            // Text("${data.current.windSpeed} km/h", style: TextStyle(fontSize: 12), textAlign: TextAlign.start,),
            // Text("${data.current.clouds}%", style: TextStyle(fontSize: 12), textAlign: TextAlign.start,),
            // Text("${data.current.humidity}%", style: TextStyle(fontSize: 12), textAlign: TextAlign.center,),
          ],
        )
      ],
    );
  }
}
