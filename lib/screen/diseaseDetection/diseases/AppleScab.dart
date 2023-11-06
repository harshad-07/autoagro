import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:carousel_pro/carousel_pro.dart';

class AppleScab extends StatefulWidget {
  final String title;

  const AppleScab({super.key, required this.title});

  @override
  _AppleScabState createState() => _AppleScabState();
}

class _AppleScabState extends State<AppleScab> {
  int activeIndex = 0;

  final controller = CarouselController();

  final urlImage = [
    "https://firebasestorage.googleapis.com/v0/b/login-draft-69de1.appspot.com/o/disease_assets%2Fscab.jpg?alt=media&token=4598e17e-2158-475a-9e0e-ab9809414412",
    "https://firebasestorage.googleapis.com/v0/b/login-draft-69de1.appspot.com/o/disease_assets%2Fscab2.jpg?alt=media&token=140bc618-8aeb-41f4-a643-40c22526bda9",
    "https://firebasestorage.googleapis.com/v0/b/login-draft-69de1.appspot.com/o/disease_assets%2Fscab3.jpg?alt=media&token=97484cf0-349b-4246-8cb6-bbb96f1639f4"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //     elevation: 0,
        //     backgroundColor: Colors.white60,
        //     iconTheme: IconThemeData(color: Colors.black)),
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
            // color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
        // padding: EdgeInsets.all(32),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_rounded),
                  alignment: Alignment.topLeft,
                  iconSize: 27),
            ),
            CarouselSlider.builder(
                itemCount: urlImage.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImages = urlImage[index];
                  return buildImage(urlImages, index);
                },
                options: CarouselOptions(
                  height: 200,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index),
                )),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                  height: 100.0,
                  width: MediaQuery.of(context).size.width - 24.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2.0,
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2.0)
                      ]),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Apple Scab',
                          style: new TextStyle(
                            fontFamily: "VT323",
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          'Venturia Inaequalis',
                          style: new TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 60, bottom: 20, left: 14, right: 14),
              child: Text(
                'symptoms'.tr,
                style:
                    TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
              child: Text(
                'appleScabSymtoms'.tr,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 40, bottom: 20, left: 14, right: 14),
              child: Text(
                'conditions'.tr,
                style:
                    TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
              child: Text(
                'appleScabConditions'.tr,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 40, bottom: 20, left: 14, right: 14),
              child: Text(
                'remedies'.tr,
                style:
                    TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
              child: Text(
                'appleScabRemedies'.tr,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 40, bottom: 20, left: 14, right: 14),
              child: Text(
                'chemicals'.tr,
                style:
                    TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
              child: Text(
                'appleScabChemicals'.tr,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget buildImage(String urlImage, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7),
      child: Image.network(urlImage, fit: BoxFit.cover),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: urlImage.length,
      effect: ExpandingDotsEffect(dotWidth: 15, activeDotColor: Colors.green),
    );
  }
}
