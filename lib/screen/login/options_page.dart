import 'package:autoagro_firebase/screen/login/login_page.dart';
import 'package:autoagro_firebase/screen/login/phone.dart';
// import 'package:autoagro_firebase/screen/login/reg_page.dart';
import 'package:flutter/material.dart';

class OptionPage extends StatelessWidget {
  const OptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: MediaQuery.sizeOf(context).width*0.65,child: Text("*Recommended", style: TextStyle(fontSize: 8), textAlign: TextAlign.end)),
              InkWell(
                splashColor: Colors.green,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PhoneReg(),),),
                child: Container(
                  width: MediaQuery.sizeOf(context).width*0.7,
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(border: Border.all(color: Colors.green), borderRadius: BorderRadius.circular(10), color: Colors.green.shade100.withOpacity(0.6)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Login using Phone Number", textAlign: TextAlign.center,),
                      Icon(Icons.phone)
                    ],
                  )
                ),
              ),
              SizedBox(height: 22),
              Text("OR"),
              SizedBox(height: 22),
              InkWell(
                splashColor: Colors.green,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),),),
                child: Container(
                  width: MediaQuery.sizeOf(context).width*0.7,
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(border: Border.all(color: Colors.green), borderRadius: BorderRadius.circular(10), color: Colors.green.shade100.withOpacity(0.6)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Login using Email", textAlign: TextAlign.center,),
                      Icon(Icons.email)
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}