import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:carousel_pro/carousel_pro.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PeachSpot extends StatefulWidget {
  final String title;

  const PeachSpot({super.key, required this.title});

  @override
  PeachSpotState createState() => PeachSpotState();
}

class PeachSpotState extends State<PeachSpot> {
  int activeIndex = 0;

  final controller = CarouselController();

  final urlImage = [
    "https://firebasestorage.googleapis.com/v0/b/login-draft-69de1.appspot.com/o/disease_assets%2Fpeachspot1.jpg?alt=media&token=a5546b7f-d485-4344-bed9-f729c51e8d4a",
    "https://firebasestorage.googleapis.com/v0/b/login-draft-69de1.appspot.com/o/disease_assets%2Fpeachspot2.jpg?alt=media&token=b5673666-f34e-4136-b319-da79cd9f61fa",
    "https://firebasestorage.googleapis.com/v0/b/login-draft-69de1.appspot.com/o/disease_assets%2Fpeachspot3.png?alt=media&token=a322f16d-a79a-440f-994f-402d510efd8c"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //     elevation: 0,
        //     backgroundColor: Colors.white60,
        //     iconTheme: IconThemeData(color: Colors.black)),
        body: ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded),
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
              height: 170,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 27, left: 20, right: 20),
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
              child: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Peach Bacterial Spot',
                      style: TextStyle(
                        fontFamily: "VT323",
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                    Text(
                      'Xanthomonas campestris pv. pruni',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              )),
        ),
        // AppBar(
        //   iconTheme: IconThemeData(color: Colors.white),
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ),
        Padding(
          padding: const EdgeInsets.only(top: 36, bottom: 20, left: 14),
          child: Text(
            'symptoms'.tr,
            style: const TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
          child: Text(
            'peachBlackSpotSymptoms'.tr,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 17, fontFamily: 'Raleway'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 20, left: 14),
          child: Text(
            'conditions'.tr,
            style: const TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
          child: Text(
            'peachBlackSpotConditions'.tr,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 17, fontFamily: 'Raleway'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 20, left: 14),
          child: Text(
            'remedies'.tr,
            style: const TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
          child: Text(
            'peachBlackSpotRemedies'.tr,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 17, fontFamily: 'Raleway'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 20, left: 14),
          child: Text(
            'chemicals'.tr,
            style: const TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
          child: Text(
            'peachBlackSpotChemicals'.tr,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 17, fontFamily: 'Raleway'),
          ),
        ),
      ],
    ));
  }

  Widget amenities(
    String url1,
    String url2,
    String url3,
    String features1,
    String features2,
    String features3,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 1.0),
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.2)
                ]),
            child: Column(
              children: <Widget>[
                Image.asset(
                  url1,
                  fit: BoxFit.contain,
                  height: 40.0,
                  width: 40.0,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(features1)
              ],
            )),
        Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 1.0),
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.2)
                ]),
            child: Column(
              children: <Widget>[
                Image.asset(
                  url2,
                  fit: BoxFit.contain,
                  height: 40.0,
                  width: 40.0,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(features2)
              ],
            )),
        Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 1.0),
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.2)
                ]),
            child: Column(
              children: <Widget>[
                Image.asset(
                  url3,
                  fit: BoxFit.contain,
                  height: 40.0,
                  width: 40.0,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(features3)
              ],
            )),
      ],
    );
  }

  Widget buildImage(String urlImage, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      child: Image.network(urlImage, fit: BoxFit.cover),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: urlImage.length,
      effect: const ExpandingDotsEffect(dotWidth: 15, activeDotColor: Colors.green),
    );
  }

  Widget about_hotel(
    String description,
  ) {
    return Padding(
        padding: const EdgeInsets.only(left: 14, top: 6, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              description,
              style: const TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
            ),
          ],
        ));
  }
}
