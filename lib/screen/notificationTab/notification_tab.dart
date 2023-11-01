import 'package:flutter/material.dart';

import '../../widgets/home_appbar_navbar.dart';

class NotificationTab extends StatelessWidget {
  const NotificationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications", style: TextStyle(color: Colors.black)),backgroundColor: Colors.white30, elevation: 0, iconTheme: IconThemeData(color: Colors.black), leading: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));},icon: Icon(Icons.arrow_back))),
    );
  }
}