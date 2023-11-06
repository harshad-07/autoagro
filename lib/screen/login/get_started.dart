import 'package:autoagro_firebase/screen/login/choose_lang.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    // final _formKey = GlobalKey<FormState>();
    // final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset((darkModeOn)? 'assets/images/logow.png' : 'assets/images/logob.png', height: 300,),
                // Theme.of(context).brightness == Brightness.light ? AssetImage('assets/images/logow.png') : AssetImage('assets/images/logob.png')
                Container(
                  child: Theme.of(context).brightness == Brightness.light
                      ? Image.asset('assets/images/logow.png')
                      : Image.asset('assets/images/logob.png'),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Let's get started",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Never a better time than now to start.",
                  style: TextStyle(
                    fontSize: 14,
                    // color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 45,
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChooseLang()));
                    },
                    child: Text("Get Started", style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                // custom button
                // SizedBox(
                //   width: double.infinity,
                //   height: 50,
                // child: CustomButton(
                //   onPressed: () async {
                //     if (ap.isSignedIn == true) {
                //       await ap.getDataFromSP().whenComplete(
                //             () => Navigator.pushReplacement(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => const HomeScreen(),
                //               ),
                //             ),
                //           );
                //     } else {
                //       Navigator.pushReplacement(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => const RegisterScreen(),
                //         ),
                //       );
                //     }
                //   },
                //   text: "Get started",
                // ),
                // )
              ],
            ),
          ),
        ),
      ),
    );

    // return Scaffold(
    //   body: SafeArea(
    //     child: SingleChildScrollView(
    //       child: Container(

    //       ),
    //     )
    //   ),
    // );
  }
}
