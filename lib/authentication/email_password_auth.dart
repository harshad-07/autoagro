// import 'package:autoagro_firebase/screen/diseaseDetection/disease_detection.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../screen/login/welcome_screen.dart';


// class EmailPassAuth extends GetxController{
//   static EmailPassAuth get instance => Get.find();

//   final _auth = FirebaseAuth.instance;
//   late final Rx<User?> firebaseUser;

//   @override
//   void onReady() {
//     firebaseUser = Rx<User?>(_auth.currentUser);
//     firebaseUser.bindStream(_auth.userChanges());
//     ever(firebaseUser, _setInitialScreen);

//     super.onReady();
//   }

//   _setInitialScreen(User? user){
//     user == null ? Get.offAll(() => WelcomeScreen()) : Get.offAll(() => DiseaseDetection());
//   }

//   Future<void> newUserWithEmailAndPass(String email, String pass) async{
//     try{
//       await _auth.createUserWithEmailAndPassword(email: email, password: pass);
//       firebaseUser.value != null ? Get.offAll(() => DiseaseDetection()) : Get.offAll(() => WelcomeScreen());
//     }on FirebaseAuthException catch(e){}catch(_){}
//   }

//   Future<void> loginUserWithEmailAndPass(String email, String pass) async{
//     try{
//       await _auth.signInWithEmailAndPassword(email: email, password: pass);
//     }on FirebaseAuthException catch(e){}catch(_){}
//   }

//   Future<void> logOut() async => _auth.signOut();

// }