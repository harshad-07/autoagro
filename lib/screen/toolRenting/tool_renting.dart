// import 'package:autoagro_draft/widgets/tool_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/tool_container.dart';

class ToolRentingPage extends StatefulWidget {
  const ToolRentingPage({super.key});

  @override
  State<ToolRentingPage> createState() => _ToolRentingPageState();
}

class _ToolRentingPageState extends State<ToolRentingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 36, 18),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
            color: Colors.white.withOpacity(0.85)),
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  ToolContainer(
                      imageList:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTk34nRtbMT-TzfBDYRatBeZzpYo5w1TdaQtNCVnwSTZjcd7eSAcbdFK2hkZZURZ8QSn1Y',
                      name: 'Temperature and Humidity Monitoring',
                      rent: 100,
                      buy: 300),
                  ToolContainer(
                      imageList:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5f-NHSn9OOK9OaG4aBlzXlfSv04nGeAVugA',
                      name: 'Soil moisture monitoring and alarming.',
                      rent: 2000,
                      buy: 6000),
                  ToolContainer(
                      imageList:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJOasIou0zykZXbBN9-x7PjF6min_J50ym_Q',
                      name: 'Rover for field survey',
                      rent: 70000,
                      buy: 900000),
                  ToolContainer(
                      imageList:
                          'https://img.buzzfeed.com/buzzfeed-static/static/2020-08/20/14/asset/778d3a598d5c/sub-buzz-4602-1597934661-5.jpg?downsize=600:*&output-format=auto&output-quality=auto',
                      name: 'Disease detection and early plant care',
                      rent: 700,
                      buy: 2000),
                  ToolContainer(
                      imageList:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqWHGbq0XUoOEj7Ov-f7fQy7J8bTX-DBRX5g',
                      name: 'Complete package of smart agricultural management',
                      rent: 3000),
                  ToolContainer(
                      imageList:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn69Lz-5n_V1qzqIp1XGpExRVb5g5PrrZjTg',
                      name: "Tractor",
                      rent: 2000),
                  ToolContainer(
                      imageList:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmRBDLhiA7MVOxHXFjuM-DuAMuQVtDSnJTpg',
                      name: "Sowing Machine",
                      rent: 1200),
                  ToolContainer(
                      imageList:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU5iCNeHNZW1u8QhPyaVaEew_O8r7eUO6fYg',
                      name: "Harvester",
                      rent: 1000),
                  ToolContainer(
                      imageList:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuRjAC-HVn8vm5d3dfVkzhS1Am4M7kTkOqGw',
                      name: "Shovel",
                      rent: 100),
                  ToolContainer(
                      imageList:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbbU3sJ8evvbOiHVqENBetWeiiphsk-fWJvw',
                      name: "Pesticide Sprayer",
                      rent: 500),
                  ToolContainer(
                      imageList:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7hm8vKxe138oUANLlz8UC-kp82DuyXspbag',
                      name: "Plough",
                      rent: 700),
                ],
              ),
            ),
            AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                    topLeft: Radius.elliptical(8.5, 25)),
                color: Colors.blueGrey,
              ),
              margin: EdgeInsets.only(top: 25),
              duration: Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("services".tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
