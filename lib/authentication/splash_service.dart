import 'dart:async';

// import 'package:autoagro_firebase/screen/diseaseDetection/disease_detection.dart';
// import 'package:autoagro_firebase/screen/login/login_page.dart';
import 'package:autoagro_firebase/screen/login/welcome_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
// import '../screen/login/phone.dart';
import '../widgets/home_appbar_navbar.dart';


class SplashService{
  void isLogin(BuildContext context){
    
    final ap = Provider.of<AuthProvider>(context, listen: false);
    
    // final auth = FirebaseAuth.instance;

    // final user = auth.currentUser;

    Timer(Duration(seconds: 5), () async{
      if (ap.isSignedIn == true) {
        await ap.getDataFromSP().whenComplete(
              () =>
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              )
            );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
          ),
        );
      }});

    // if(user != null){
    //   Timer(Duration(seconds: 3), () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DiseaseDetection()));});
    // }else{
    //   Timer(Duration(seconds: 3), () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));});
    // }
  }
}