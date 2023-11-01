import 'package:autoagro_firebase/provider/auth_provider.dart';
// import 'package:autoagro_firebase/screen/login/login_page.dart';
import 'package:autoagro_firebase/screen/login/options_page.dart';
import 'package:autoagro_firebase/screen/login/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

import 'screen/diseaseDetection/disease_detection.dart';
import 'screen/iotPage/iot_page.dart';
import 'screen/login/get_started.dart';
// import 'screen/login/otp.dart';
import 'screen/login/phone.dart';
import 'screen/login/reg_page.dart';
import 'screen/login/welcome_screen.dart';
import 'screen/toolRenting/tool_renting.dart';
import 'screen/weather/weather_page.dart';
import 'widgets/home_appbar_navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          "/welcome": (context) => WelcomeScreen(),
          "/login": (context) => PhoneReg(),
          "/getStared": (context) => GetStarted(),
          "/options": (context) => OptionPage(),
          // "/otp" :(context) => Otp(verificationId: verificationId),
          "/register": (context) => RegisterPage(),
          "/home": (context) => HomePage(),
          "/disease": (context) => DiseaseDetection(),
          "/iot": (context) => IoTPage(),
          "/toolRenting": (context) => ToolRentingPage(),
          "/weather": (context) => WeatherPage(),
        },
      ),
    );
  }
}
