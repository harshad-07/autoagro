import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:carousel_pro/carousel_pro.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GrapeLeafBlight extends StatefulWidget {
  final String title;

  const GrapeLeafBlight({super.key, required this.title});

  @override
  _GrapeLeafBlightState createState() => _GrapeLeafBlightState();
}

class _GrapeLeafBlightState extends State<GrapeLeafBlight> {
  int activeIndex = 0;

  final controller = CarouselController();

  final urlImage = [
    "https://firebasestorage.googleapis.com/v0/b/login-draft-69de1.appspot.com/o/disease_assets%2Fgrapebli.jpg?alt=media&token=389b7d6f-dca4-4587-95de-545d978e2a5a",
    "https://firebasestorage.googleapis.com/v0/b/login-draft-69de1.appspot.com/o/disease_assets%2Fgrapebli2.jpg?alt=media&token=63b03399-7210-4a31-9ed0-4236735904d3",
    "https://firebasestorage.googleapis.com/v0/b/login-draft-69de1.appspot.com/o/disease_assets%2Fgrapebli3.jpg?alt=media&token=e79e79a5-a449-4dbf-b683-36e210e04bbe"
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
                            tag: "Grape Leaf Blight",
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
                              'Grape Leaf Blight',
                              style: new TextStyle(
                                fontFamily: "VT323",
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                              ),
                            ),
                            Text(
                              'Pseudocercospora vitis',
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
                '     On leaf surface we will see lesions which are irregularly shaped (2 to 25 mm in diameter). Initially lesions are dull red to brown in color turn black later. If disease is severe this lesions may coalesce. On berries we can see symptom similar to black rot but the entire clusters will collapse.',
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
                '     Common in tropical and subtropical grapes. The disease appear late in the season. Cynthiana and Cabernet Sauvignon are susceptible to this pathogen.',
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
                '1. Fungicides sprayed for other diseases in the season may help to reduce this disease.',
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
                '     The most widely used fungicide to control diseases of grapevine is Bordeaux mixture, a copper fungicide. However, like all copper compounds, this fungicide may produce symptoms of toxicity in young plant tissues, and the corrosive action of the fungicide may compromise the structure of the vine.',
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
