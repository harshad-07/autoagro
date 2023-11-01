// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/global_controller.dart';
import '../../../model/weatherAPI/hourly_weather_data.dart';
import '../utils/custom_colors.dart';

// import 'package:autoagro_draft/controller/global_controller.dart';
// import 'package:autoagro_draft/models/weatherAPI/hourly_weather_data.dart';
// import 'package:autoagro_draft/screens/weather/utils/custom_colors.dart';

class HourlyWeatherWidget extends StatelessWidget {
  final HourlyWeatherData data;

  HourlyWeatherWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  //card index for weather
  RxInt cardIndex = GlobalController().getCurrentIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
          child: Text("today".tr, style: TextStyle(fontSize: 18)),
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
      height: 150,
      padding: EdgeInsets.only(bottom: 10, top: 10),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: data.hourly.length > 12 ? 12 : data.hourly.length,
        itemBuilder: (context, index) {
          return Obx(() => GestureDetector(
              onTap: () => cardIndex.value = index,
              child: Container(
                width: 90,
                margin: EdgeInsets.only(left: 20, right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0.5, 0),
                        blurRadius: 30,
                        spreadRadius: 1,
                        color: CustomColors.dividerLine.withAlpha(150))
                  ],
                  gradient: cardIndex.value == index
                      ? LinearGradient(colors: [
                          CustomColors.firstGradientColor,
                          CustomColors.secondGradientColor
                        ])
                      : LinearGradient(
                          colors: [Colors.white60, Colors.white30]),
                ),
                child: HourlyDetails(
                  index: index,
                  cardIndex: cardIndex.toInt(),
                  icon: data.hourly[index].weather![0].icon!,
                  temp: data.hourly[index].temp!.round(),
                  timeStamp: data.hourly[index].dt!,
                ),
              )));
        },
      ),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  int temp;
  int timeStamp;
  String icon;

  int index;
  int cardIndex;

  HourlyDetails({
    Key? key,
    required this.temp,
    required this.timeStamp,
    required this.icon,
    required this.index,
    required this.cardIndex,
  }) : super(key: key);

  String getTime(final timeStamp) {
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String time = DateFormat('jm').format(dt);
    return time;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(getTime(timeStamp),
              style: TextStyle(
                  color: cardIndex == index ? Colors.white : Colors.black)),
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: Image.asset('assets/weather_images/$icon.png',
              height: 40, width: 40),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Text("$temp°",
              style: TextStyle(
                  color: cardIndex == index ? Colors.white : Colors.black)),
        ),
      ],
    );
  }
}
