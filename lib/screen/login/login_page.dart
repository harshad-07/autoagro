// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }



// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:autoagro_firebase/screen/login/phone.dart';
// import 'package:autoagro_firebase/utils/toast.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../../widgets/form_text_field.dart';
import '../diseaseDetection/disease_detection.dart';
import 'reg_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String name = "";
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  // FirebaseAuth _auth = FirebaseAuth.instance;

  void logIn(){
    setState(() {
      isLoading = true;
    });
    getLogin(context, emailController.text, passwordController.text);
    // _auth.signInWithEmailAndPassword(email: email.toString(), password: password.toString()).then((value) {
    //   succesfull("Successfully Loged In as ${value.user!.email.toString()}");
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => DiseaseDetection()));
    //   setState(() {
    //     isLoading = false;
    //   });
    // }).onError((error, stackTrace) {
    //   toastMessage(error.toString());
    //   setState(() {
    //     isLoading = false;
    //   });
    // });
  }

  // moveToHome(BuildContext context) async {
  //   if(_formKey.currentState!.validate()){
  //     setState(() {
  //       changeButton = true;
  //     });
  //     await Future.delayed(Duration(milliseconds: 1250));
  //     await Navigator.pushNamed(context, "/home");
  //     setState(() {
  //       changeButton = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset("assets/images/login_img.png", fit: BoxFit.contain,height: 300,),
                SizedBox(height: 20,),
                Text("Welcome $name", style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                  child: Column(
                    children: [
                      formTextField(
                        hintText: 'Enter Your Email', 
                        labelText: 'Email',
                        obsecureText: false, 
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Email cannot be empty";
                          }
                          else if(value.contains('@') == false){
                            return "Enter valid email address";
                          }
                          return null;
                        },
                        controller: emailController
                      ),
                      SizedBox(height: 22),
                      formTextField(
                        obsecureText: true,
                        hintText: 'Enter Password', 
                        labelText: 'Password', 
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Password cannot be empty";
                          }
                          else if(value.length < 6){
                            return "Password must be greater han 6 characters";
                          }
                          return null;
                        },
                        controller: passwordController
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                // Material(
                //   color: Colors.cyan,
                //   borderRadius: BorderRadius.circular(changeButton ? 40 : 8),
                //   child: InkWell(
                //     onTap: () => moveToHome(context),
                //     child: AnimatedContainer(
                //       duration: Duration(seconds: 1),
                //       width: changeButton? 40 : 125,
                //       height: 40,
                //       alignment: Alignment.center,
                //       child: changeButton ? Icon(Icons.done, color: Colors.white,) :
                //       Text(
                //         "Login",
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 16
                //         ),
                //       ),
                //       decoration: BoxDecoration(
                //         shape: changeButton ? BoxShape.circle : BoxShape.rectangle,
                        
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 45,
                  width: MediaQuery.sizeOf(context).width*0.75,
                  child: ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        logIn();
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                        // SignUpController.instance.registerUser(controller.email.trim(), controller.password.trim());
                      }
                    }, 
                    child: isLoading ? CircularProgressIndicator(color: Colors.white,) : Text("Login", style: TextStyle(fontSize: 18)),
                    // style: TextButton.styleFrom(minimumSize: Size(125, 40)),
                    style: ElevatedButton.styleFrom( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), backgroundColor: Colors.green),
                  ),
                ),
                SizedBox(height: 30,),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneReg()));
                    // logIn();
                  },
                  child: Text("New here? Create an Account", style: TextStyle(color: Colors.green)),
                )
              ],
            ),
          ),
        ),
      )
    );
  }

  void getLogin(BuildContext context, String email, String password)async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.login(
      context: context, 
      email: email, 
      password: password, 
      onSuccess: (){
        ap.checkExistingUser().then(
          (value) async {
            if (value == true) {
              // user exists in our app
              ap.getDataFromFirestore().then(
                    (value) => ap.saveUserDataToSP().then(
                          (value) => ap.setSignIn().then(
                                (value) => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const DiseaseDetection(),
                                    ),
                                    (route) => false),
                              ),
                        ),
                  );
            } else {
              // new user
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterPage()),
                  (route) => false);
            }
          },
        );
      }
    );
  }

}