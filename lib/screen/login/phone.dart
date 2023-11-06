import 'package:autoagro_firebase/provider/auth_provider.dart';
// import 'package:autoagro_firebase/screen/login/login_page.dart';
// import 'package:autoagro_firebase/screen/login/otp.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PhoneReg extends StatefulWidget {
  const PhoneReg({super.key});

  @override
  State<PhoneReg> createState() => _LoginPageState();
}

class _LoginPageState extends State<PhoneReg> {
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController number = TextEditingController();
  final countryPicker = FlCountryCodePicker();
  CountryCode? countryCode;

  @override
  Widget build(BuildContext context) {
    number.selection = TextSelection.fromPosition(
      TextPosition(
        offset: number.text.length,
      ),
    );
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Container(
            // height: MediaQuery.sizeOf(context).height,
            margin: EdgeInsets.fromLTRB(30, 100, 30, 0),
            // alignment: Alignment.center,
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/welcome.svg',
                  width: MediaQuery.sizeOf(context).width * 0.67,
                ),
                SizedBox(
                  height: 16,
                ),
                Text("start".tr,
                    style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 20,
                ),
                Text("provide".tr,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 20,
                ),
                Text("code".tr,
                    style: TextStyle(
                        fontSize: 15.2,
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  onTapOutside: (event) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                  controller: number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter The Phone Number";
                    } else if (value.length < 7) {
                      return "Please Enter The Valid Number";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.red),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.green.shade700, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "enterPhone".tr,
                    // labelText: "Phone Number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: GestureDetector(
                      onTap: () async {
                        final code =
                            await countryPicker.showPicker(context: context);
                        setState(() {
                          countryCode = code;
                          print(countryCode!.dialCode);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.only(right: 15),
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green.shade500),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: 2),
                                width: 55,
                                child: Center(
                                    child: countryCode != null
                                        ? countryCode!.flagImage()
                                        : Text(
                                            "🇮🇳",
                                            style: TextStyle(fontSize: 22),
                                          ))),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                countryCode?.dialCode ?? "+91",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down_outlined,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 45,
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      // if(_formKey.currentState!.validate()){Navigator.push(context, MaterialPageRoute(builder: (context) => Otp(verificationId: verificationId)));};
                      if (_formKey.currentState!.validate()) {
                        debugPrint(countryCode != null
                            ? "${countryCode!.dialCode} ${number.text}"
                            : "+91 ${number.text}");
                        sendPhoneNumber();
                        // setState(() {
                        //   isLoading = false;
                        // });
                      }
                    },
                    child: isLoading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text("getCode".tr, style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                // SizedBox(height: 30,),
                // Container(height: 1, decoration: BoxDecoration(color: Colors.green)),
                // SizedBox(height: 20,),
                // Text("OR"),
                // SizedBox(height: 20,),
                // SizedBox(
                //   height: 45,
                //   width: MediaQuery.sizeOf(context).width*0.7,
                //   child: ElevatedButton(
                //     onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       children: [
                //         Text("Login with Email", style: TextStyle()),
                //         Icon(Icons.email)
                //       ],
                //     ),
                //     style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = number.text.trim();
    ap.signInWithPhone(
        context,
        countryCode != null
            ? "${countryCode!.dialCode} $phoneNumber"
            : "+91 $phoneNumber");
    // setState(() {
    //   isLoading = false;
    // });
  }
}




// GestureDetector(
//                                 onTap: () async{
//                                   final code = await countryPicker.showPicker(context: context);
//                                   setState(() {
//                                     countryCode = code;
//                                   });
//                                 },
//                                 child: SizedBox(width: 50, child: Center(child: Text("🇮🇳", style: TextStyle(fontSize: 18),)))),
//                               GestureDetector(
//                                 onTap: () async{
//                                   final code = await countryPicker.showPicker(context: context);
//                                 },
//                                 child: SizedBox(width: 40,child: Text("+91", style: TextStyle(color: Colors.white),))),







// Container(
//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.85),
//                       border: Border.all(width: 0),
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color(0xffeeeeee),
//                           blurRadius: 2
//                         )
//                       ],
//                     ),
//                     child: Material(
//                       child: InternationalPhoneNumberInput(
//                         scrollPadding: EdgeInsets.zero,
//                         textFieldController: number,
//                         validator: (value) {
//                           if(value!.isEmpty){
//                             return "Please Enter The Phone Number";
//                           }
//                           else if(value.length < 5){
//                             return "Please Enter The Valid Number";
//                           }
//                           return null;
//                         },
//                         spaceBetweenSelectorAndTextField: 0,
//                         onInputChanged: (value){},
//                         selectorTextStyle: TextStyle(color: Theme.of(context).brightness == Brightness.light? Colors.black : Colors.white),
//                         cursorColor: Color(0xff5F5FE4),
//                         selectorConfig: SelectorConfig(selectorType: PhoneInputSelectorType.DIALOG, leadingPadding: 16, ),
//                         inputDecoration: InputDecoration(
//                           contentPadding: EdgeInsets.only(bottom: 15, left: 0),
//                           border: InputBorder.none,
//                           hintText: 'Phone Number',
//                           hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
//                         ),
//                       ),
//                     ),
//                   ),
                  