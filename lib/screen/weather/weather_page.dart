// import 'package:autoagro_draft/controller/global_controller.dart';
// import 'package:autoagro_draft/screens/weather/widgets/current_weather_widget.dart';
// import 'package:autoagro_draft/screens/weather/widgets/daily_weather_widget.dart';
// import 'package:autoagro_draft/screens/weather/widgets/header.dart';
// import 'package:autoagro_draft/screens/weather/widgets/hourly_weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/global_controller.dart';
import 'widgets/current_weather_widget.dart';
import 'widgets/daily_weather_widget.dart';
import 'widgets/header.dart';
import 'widgets/hourly_weather_widget.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

Future<void> _refresh(){
  return Future.delayed(const Duration(seconds: 6));
}

class _WeatherPageState extends State<WeatherPage> {

  final GlobalController controller = Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 36, 18),
      body: Obx(() => controller.checkLoading().isTrue ? 
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/clouds.png'),
              CircularProgressIndicator(),
            ],
          ),
        )
        : Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(50)), color: Colors.white.withOpacity(0.85)),
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: ListView(
              children: [
                HeaderWidget(),
                SizedBox(height: 12),
                CurrentWeatherWidget(data: controller.getWeatherData().getCurrentWeatherData()),
                SizedBox(height: 25),
                HourlyWeatherWidget(data: controller.getWeatherData().getHourlyWeatherData(),),
                SizedBox(height: 12),
                DailyWeatherWidget(data: controller.getWeatherData().getDailyWeatherData()),
              ],
            ),
          ),
        )
      )
    );
  }
}



// Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(50)), color: Colors.blue),
//           ),
//           AnimatedContainer(
//             decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), topRight: Radius.circular(20), topLeft: Radius.elliptical(8.5, 25)), color: Colors.amber,),
//             margin: EdgeInsets.only(top: 25),
//             duration: Duration(milliseconds: 500),
//             child: Padding(
//               padding: const EdgeInsets.all(18.0),
//               child: Text("Weather Data", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
//             ),
//           ),
//         ],
//       ),