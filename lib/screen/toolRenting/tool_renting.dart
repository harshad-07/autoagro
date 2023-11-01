// import 'package:autoagro_draft/widgets/tool_container.dart';
import 'package:flutter/material.dart';

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
        decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(50)), color: Colors.white.withOpacity(0.85)),
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  ToolContainer(imageList: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn69Lz-5n_V1qzqIp1XGpExRVb5g5PrrZjTg', name: "Tractor", quantity: 69),
                  ToolContainer(imageList: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmRBDLhiA7MVOxHXFjuM-DuAMuQVtDSnJTpg', name: "Sowing Machine", quantity: 25),
                  ToolContainer(imageList: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU5iCNeHNZW1u8QhPyaVaEew_O8r7eUO6fYg', name: "Harvester", quantity: 10),
                  ToolContainer(imageList: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuRjAC-HVn8vm5d3dfVkzhS1Am4M7kTkOqGw', name: "Shovel", quantity: 70),
                  ToolContainer(imageList: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbbU3sJ8evvbOiHVqENBetWeiiphsk-fWJvw', name: "Pesticide Sprayer", quantity: 25),
                  ToolContainer(imageList: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7hm8vKxe138oUANLlz8UC-kp82DuyXspbag', name: "Plough", quantity: 20),
                ],
              ),
            ),
            AnimatedContainer(
              decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), topRight: Radius.circular(20), topLeft: Radius.elliptical(8.5, 25)), color: Colors.blueGrey,),
              margin: EdgeInsets.only(top: 25),
              duration: Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("Tool Renting", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}