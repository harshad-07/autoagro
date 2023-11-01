import 'package:autoagro_firebase/provider/auth_provider.dart';
// import 'package:autoagro_firebase/screen/diseaseDetection/disease_detection.dart';
import 'package:autoagro_firebase/screen/login/reg_page.dart';
// import 'package:autoagro_firebase/utils/consts.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../widgets/home_appbar_navbar.dart';

class Otp extends StatefulWidget {

  final String verificationId;

  const Otp({super.key, required this.verificationId});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {

  String? otpCode;

  final _formKey = GlobalKey<FormState>();
  TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final isLoading = Provider.of<AuthProvider>(context, listen: true).isLoading;
    
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white30, elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
      body: isLoading == true
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          )
        :  Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.only(left: 30, right: 30, ),
            // alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/otp.svg', width: MediaQuery.sizeOf(context).width*0.44, ),
                SizedBox(height: 16,),
                Text("We gotch you!", style: TextStyle(fontSize: 22),),
                SizedBox(height: 20,),
                Text("Please enter the verification code sent to your mobile number.", style: TextStyle(fontSize: 16, ), textAlign: TextAlign.center),
                SizedBox(height: 30,),
        
                Pinput(
                  onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                  validator: (value) {
                    if(value!.isEmpty){
                        return "Enter the verification code";
                      }
                      else if(value.length < 6){
                        return "Enter the 6-Digit verification code";
                      }
                      return null;
                    },
                  length: 6,
                  errorPinTheme: PinTheme(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(border: Border.all(color: Colors.red.shade700), borderRadius: BorderRadius.circular(10), color: Colors.red.shade50)
                  ),
                  defaultPinTheme: PinTheme(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(border: Border.all(color: Colors.green.shade700), borderRadius: BorderRadius.circular(10), color: Colors.green.shade50)
                  ),
                  onCompleted: (value) {
                    setState(() {
                      otpCode = value;
                    });
                  },
                  // showCursor: true,
                  // hapticFeedbackType: HapticFeedbackType.mediumImpact,
                ),
        
                // OtpTextField(
                //   cursorColor: Color(0xff5F5FE4),
                //   filled: true,
                //   fillColor: Colors.grey.withOpacity(0.58),
                // ),
                
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 30,
                      child: TextButton(
                        onPressed: (){Navigator.pop(context);}, 
                        child: Text(
                          "Entered Incorrect Number?", 
                          style: TextStyle(
                            fontSize: 12, 
                            color: Colors.green.shade600, 
                            fontWeight: FontWeight.bold)
                          )
                      ),
                    ),
                     SizedBox(
                      height: 30,
                      child: TextButton(
                        onPressed: (){Navigator.pop(context);}, 
                        child: Text(
                          "Re-send code in ", 
                          style: TextStyle(
                            fontSize: 12, 
                            color: Colors.green.shade600, 
                            fontWeight: FontWeight.bold)
                          )
                      ),
                    ),
                    // Text("Entered Incorrect Number?", style: TextStyle(fontSize: 12, color: Color(0xff5F5FE4), fontWeight: FontWeight.bold)),
                    // Text("Re-send code in ", style: TextStyle(fontSize: 12, color: Color(0xff5F5FE4), fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(height: 30,),
                SizedBox(
                  height: 45,
                  width: MediaQuery.sizeOf(context).width*0.7,
                  child: ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        if(otpCode != null){
                          verifyOtp(context, otpCode!);
                        }
                      }
                      // else{
                      //   showSnackBar(context, "Enter 6-Digit code");
                      // }
                      // if(_formKey.currentState!.validate()){Navigator.pushNamed(context, "/register");};
                      // Navigator.pushNamed(context, "/register");
                    }, 
                    child: Text("Verify Code", style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), backgroundColor: Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

  void verifyOtp(BuildContext context, String userOtp){
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyTheOtp(
      context: context,
      verificationId: widget.verificationId,
      userOtp: userOtp,
      onSuccess: () {

        // checking whether user exists in the db

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
                                      builder: (context) => const HomePage(),
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
      },
    );
    // if(_formKey.currentState!.validate()){Navigator.pushNamed(context, "/register");};
  }

}