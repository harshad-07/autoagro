import 'package:autoagro_firebase/language/locale.dart';
import 'package:autoagro_firebase/provider/auth_provider.dart';
// import 'package:autoagro_firebase/screen/login/login_page.dart';
import 'package:autoagro_firebase/screen/login/options_page.dart';
import 'package:autoagro_firebase/screen/login/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      child: GetMaterialApp(
        translations: LocaleStrings(),
        locale: const Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        routes: {
          "/welcome": (context) => const WelcomeScreen(),
          "/login": (context) => const PhoneReg(),
          "/getStared": (context) => const GetStarted(),
          "/options": (context) => const OptionPage(),
          // "/otp" :(context) => Otp(verificationId: verificationId),
          "/register": (context) => const RegisterPage(),
          "/home": (context) => const HomePage(),
          "/disease": (context) => const DiseaseDetection(),
          "/iot": (context) => const IoTPage(),
          "/toolRenting": (context) => const ToolRentingPage(),
          "/weather": (context) => const WeatherPage(),
        },
      ),
    );
  }
}
