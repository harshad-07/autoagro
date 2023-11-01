import 'package:autoagro_firebase/authentication/splash_service.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashService service = SplashService();

  @override
  void initState() {
    super.initState();
    service.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FadeInImage(image: AssetImage('assets/images/logo2.jpeg'), placeholder: AssetImage('assets/images/logo.jpeg'),),
            ),
            SizedBox(height: 12),
            // Text("AutoAgro", style: TextStyle(color: Colors.green, fontStyle: FontStyle.italic, fontSize: 22, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}