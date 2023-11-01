// import 'package:autoagro_draft/models/weatherAPI/daily_weather_data.dart';
// import 'package:autoagro_draft/screens/weather/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../model/weatherAPI/daily_weather_data.dart';
import '../utils/custom_colors.dart';

class DailyWeatherWidget extends StatelessWidget {
  final DailyWeatherData data;

  const DailyWeatherWidget({super.key, required this.data});

  String getDay(final day) {
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final date = DateFormat('EEE, MMM d').format(dt);
    return date;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white.withAlpha(150),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
              bottom: 10,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 7),
              child: Text("next".tr,
                  style: TextStyle(
                      color: CustomColors.textColorBlack, fontSize: 17)),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 310,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: data.daily.length > 7 ? 7 : data.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 70,
                // padding: EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        getDay(data.daily[index].dt),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                          'assets/weather_images/${data.daily[index].weather![0].icon}.png'),
                    ),
                    Text(
                        "${data.daily[index].temp!.max!.round()}° / ${data.daily[index].temp!.min!.round()}°")
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
