// import 'package:autoagro_draft/controller/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {

  String area = "";
  String city = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());
  final GlobalController globalController = Get.put(GlobalController(), permanent: true);
  
  @override
  void initState() {
    getAddress(globalController.getLatitude().value, globalController.getLongitude().value);
    super.initState();
  }
  
  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark current = placemark[0];
    setState(() {
      area = current.subLocality!;
      city = current.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(25, 35, 0, 0),
          alignment: Alignment.topLeft,
          child: Text(area + ", " + city, style: TextStyle(fontSize: 20)),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(25, 5, 0, 0),
          alignment: Alignment.topLeft,
          child: Text(date, style: TextStyle(fontSize: 14, color: Colors.grey.shade800)),
        ),
      ],
    );
  }
}