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
              height: 170,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            )),
        Padding(
          padding: EdgeInsets.only(top: 27, left: 20, right: 20),
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
                  children: <Widget>[
                    Text(
                      'Peach Bacterial Spot',
                      style: new TextStyle(
                        fontFamily: "VT323",
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                    Text(
                      'Xanthomonas campestris pv. pruni',
                      style: new TextStyle(
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
          padding: EdgeInsets.only(top: 36, bottom: 20, left: 14),
          child: Text(
            'symptoms'.tr,
            style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
          child: Text(
            '1. Symptoms of this disease include fruit spots, leaf spots, and twig cankers. Fruit symptoms include pitting, cracking, gumming, and watersoaked tissue, which can make the fruit more susceptible to brown rot, rhizopus, and other fungal infections.\n\n2. Severe leaf spot infections can cause early defoliation. Severe defoliation can result in reduced fruit size, and sunburn and cracking of fruit.\n\n3. Early defoliated trees are reduced in vigor and winter hardiness. Fruit symptoms of bacterial spot may be confused with peach scab, caused by the fungus Cladosporium carpophyllium, however scab spots are more circular, have a dark brown/greenish, fuzzy appearance, and do not pit the fruit surface, although skin cracking can occur.\n\n4. Scab does not cause leaf symptoms but can cause spots on twigs. Initial fruit spots of bacterial spot may be superficial but develop into craters. Leaf symptoms of bacterial spot on peaches and nectarines are generally dark, small lesions, often clustered at the leaf tip where water collects during dews and rain. Leaf tissue around lesions can turn yellow.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40, bottom: 20, left: 14),
          child: Text(
            'conditions'.tr,
            style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
          child: Text(
            '1. The pathogen for bacterial spot overwinters in protected areas such as cracks in the bark and in leaf scars that were infected the previous season. As temperatures rise over 65 degrees F. (18 C.) and budding begins, the bacteria begin to multiply.\n\n2. They are spread from cankers via dripping dew, rain splashing or wind. Severe fruit infections occur most frequently when there is ample rainfall combined with high humidity.\n\n3. The infection is also most severe when the trees are planted in light, sandy soil and/or if trees are stressed. Bacterial spot symptoms on leaves generally are not seen until after bloom but onset can occur earlier if conditions are highly favorable.\n\n4. Fruit are very susceptible when exposed after shuck split and the susceptibility goes down after pit hardening in mid- to late June.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40, bottom: 20, left: 14),
          child: Text(
            'remedies'.tr,
            style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
          child: Text(
            'Whenever possible and practical, the best strategy is to use cultivars with better bacterial spot resistance. Protect trees from strong winds by establishing shelter belt trees on the windward side of the orchard. Another strategy is to establish sod strips between trees and to use gravel or other dust-suppressing methods on nearby dirt roads. Removal of gummy-blackened branch tips typical of bacterial spot during spring pruning may help somewhat to reduce inoculum levels. Fertilize where needed to maintain vigorous but not excessive shoot growth.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40, bottom: 20, left: 14),
          child: Text(
            'chemicals'.tr,
            style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
          child: Text(
            'peachBlackSpotChemicals'.tr,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
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
                      offset: Offset(0, 1.0),
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
                SizedBox(
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
                      offset: Offset(0, 1.0),
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
                SizedBox(
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
                      offset: Offset(0, 1.0),
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
                SizedBox(
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

  Widget about_hotel(
    String description,
  ) {
    return Padding(
        padding: EdgeInsets.only(left: 14, top: 6, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              description,
              style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
            ),
          ],
        ));
  }
}
