import 'package:autoagro_firebase/screen/login/phone.dart';
import 'package:autoagro_firebase/widgets/custom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChooseLang extends StatefulWidget {
  const ChooseLang({super.key});

  @override
  State<ChooseLang> createState() => _ChooseLangState();
}

class _ChooseLangState extends State<ChooseLang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('choose'.tr,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Card(
              child: TextButton(
                  onPressed: () {
                    var locale = Locale('mr', 'IN');
                    Get.updateLocale(locale);
                  },
                  child: Text(
                    'मराठी',
                    style: TextStyle(color: Colors.green),
                  )),
            ),
            Card(
              child: TextButton(
                  onPressed: () {
                    var locale = Locale('hi', 'IN');
                    Get.updateLocale(locale);
                  },
                  child: Text(
                    'हिंदी',
                    style: TextStyle(color: Colors.green),
                  )),
            ),
            Card(
              child: TextButton(
                  onPressed: () {
                    var locale = Locale('en', 'US');
                    Get.updateLocale(locale);
                  },
                  child: Text(
                    'English',
                    style: TextStyle(color: Colors.green),
                  )),
            ),
            SizedBox(height: 12),
            CustomButton(
                text: 'continue'.tr,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PhoneReg(),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
