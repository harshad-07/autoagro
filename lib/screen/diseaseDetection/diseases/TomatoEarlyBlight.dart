import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:carousel_pro/carousel_pro.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TomatoEarlyBlight extends StatefulWidget {
  final String title;

  const TomatoEarlyBlight({super.key, required this.title});

  @override
  _TomatoEarlyBlightState createState() => _TomatoEarlyBlightState();
}

class _TomatoEarlyBlightState extends State<TomatoEarlyBlight> {
  int activeIndex = 0;

  final controller = CarouselController();

  final urlImage = [
    "https://firebasestorage.googleapis.com/v0/b/login-draft-69de1.appspot.com/o/disease_assets%2Ftlb.jpg?alt=media&token=8896d3ca-82af-4a91-8123-8633df715fd3",
    "https://firebasestorage.googleapis.com/v0/b/login-draft-69de1.appspot.com/o/disease_assets%2Ftlb2.jpg?alt=media&token=1af69783-16ef-4aa3-8ca6-1b6f04812f87",
    "https://firebasestorage.googleapis.com/v0/b/login-draft-69de1.appspot.com/o/disease_assets%2Ftlb3.jpg?alt=media&token=e9f0a23d-5988-445b-b724-5061a29c1038"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white60,
            iconTheme: IconThemeData(color: Colors.black)),
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                SizedBox(
                    height: 300.0,
                    child: Stack(
                      children: <Widget>[
                        Hero(
                            tag: "Tomato Early Blight",
                            child: CarouselSlider.builder(
                                itemCount: urlImage.length,
                                itemBuilder: (context, index, realIndex) {
                                  final urlImages = urlImage[index];
                                  return buildImage(urlImages, index);
                                },
                                options: CarouselOptions(
                                  height: 100,
                                  onPageChanged: (index, reason) =>
                                      setState(() => activeIndex = index),
                                ))),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 270, left: 20, right: 20),
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
                              'Tomato Early Blight',
                              style: new TextStyle(
                                fontFamily: "VT323",
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                              ),
                            ),
                            Text(
                              'Alternaria Solani',
                              style: new TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                AppBar(
                  iconTheme: IconThemeData(color: Colors.white),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 60, bottom: 20, left: 14),
              child: Text(
                'SYMPTOMS',
                style:
                    TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
              child: Text(
                '     Symptoms of early blight occur on older foliage, stem, and fruits. Gray to brown spots appear on leaves and gradually grow in a concentric manner around a clear center - the characteristic “bullseye” formation. These lesions are surrounded by a bright yellow halo. As the disease progresses, entire leaves may turn chlorotic and shed, leading to significant defoliation. When leaves die and fall, fruits become more vulnerable to sun scald. The same type of spots with a clear center appears on stems and fruits. Rotting of fruits and sometimes dropping follows.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 20, left: 14),
              child: Text(
                'FAVORABLE ENVIRONMENT CONDITIONS',
                style:
                    TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
              child: Text(
                '     Warm temperatures (24-29°C) and high humidity (90%) favor development of the disease. A long wet period (or alternating wet/dry weather) enhances the production of spores, which may be spread via wind, splashing rain or overhead irrigation. Tubers harvested green or in wet conditions are particularly susceptible to an infection. It often strikes after a period of heavy rainfall and is particularly destructive in tropical and subtropical areas.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 20, left: 14),
              child: Text(
                'MANAGEMENT (REMEDIES)',
                style:
                    TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
              child: Text(
                '1. Look for varieties that are resistant to the disease.\n\n2. Plant or transplant on raised beds to improve drainage.\n\n3. Use certified pathogen-free seeds or transplants. \n\n4. Orient rows in the direction of main winds and avoid shaded areas.\n\n5. Space plants to allow the canopy to dry quickly after rainfall or irrigation. \n\n6. Lay mulch on the soil to keep plants from touching the soil. \n\n7. Monitor fields for signs of the disease, particularly during wet weather.\n\n8. Alternatively, plow debris deep in the soil (more than 45 cm).',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 20, left: 14),
              child: Text(
                'CHEMICAL/BIOLOGICAL CONTROL',
                style:
                    TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
              child: Text(
                '1. Application of products based on Bacillus subtilis or copper-based fungicides registered as organic can treat this disease.  \n\n2. Always consider an integrated approach with preventive measures and biological treatments if available. There are numerous fungicides on the market for controlling early blight. Fungicides based on or combinations of azoxystrobin, pyraclostrobin, difenoconazole, boscalid, chlorothalonil, fenamidone, maneb, mancozeb, trifloxystrobin, and ziram can be used. Rotation of different chemical compounds is recommended. Apply treatments in a timely manner, taking into account weather conditions. Check carefully the preharvest interval at which you can harvest safely after the application of these products.\n\n3. Biofungicides: There is a strain of bacteria that is effective at treating cedar apple rust on apple trees. It is a special strain of Bacillus subtilis',
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
