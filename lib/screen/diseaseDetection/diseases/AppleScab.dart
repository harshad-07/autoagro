import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
                'SYMPTOMS',
                style:
                    TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
              child: Text(
                '     The first visible symptoms of apple scab appear in the spring in the form of minute, circular, olive-green spots on leaves, often along a main vein. As they enlarge, they become brownish-black and eventually coalesce to form large patches of necrotic tissue. As they develop further, they often coalesce and become raised, hard and corky. This restricts the expansion of the fruit and leads to distortion and cracking of the skin that expose the flesh. Light attacks do not affect the fruit quality significantly. However, the scabs can expose the fruits to opportunistic pathogens and rots, reducing the storage capacity and the quality.  Affected leaves are often deformed and fall off prematurely, leading to defoliation in case of heavy infections. On shoots, the infections causes blistering and cracking that can then provide entry for opportunistic pathogens. On the fruits, brown to dark brown circular areas appear on the surface.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 40, bottom: 20, left: 14, right: 14),
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
                '     Apple scab is a disease caused by the fungus Venturia inaequalis. It survives the winter mainly on infected leaves on the ground but also on bud scales or lesions on wood. At the onset of spring, the fungus resumes growth and starts to produce spores, which are later discharged and dispersed over long distances by the wind. These spores land on developing leaves and fruits and start a new infection. Outer parts of unopened fruit buds are highly susceptible to scab. However, as the fruit matures it becomes much less susceptible. Humid environment, wetting period of leaves or fruits are essential for the infection. Alternative hosts include shrubs of the genus Cotoneaster, Pyracantha and Sorbus. All apple varieties are susceptible to scab, with Gala being more vulnerable.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 40, bottom: 20, left: 14, right: 14),
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
                '''1. Use tolerant or resistant varieties.\n\n2. Monitor orchards for signs of the disease.\n\n3. Pick up affected leaves, shoots and fruits.\n\n4. Rake all the fallen leaves from around your trees after harvest.\n\n5. Alternatively, apply 5% urea to leaves in the autumn to enhance their decomposition and to obstruct the life cycle of the fungus.\n\n6. Excessive leaf litter can can also be mowed to speed up the breakdown of tissues.\n\n7. Ensure a pruning method that allow for more air circulation.\n\n8. Water in the evening or early morning hours and avoid overhead irrigation.\n\n9. Avoid getting foliage wet when watering.\n\n10. Apply lime after leaf drop to increase soil pH.\n\n11. Spread a mulch under the trees, keeping it away from the trunk.''',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 40, bottom: 20, left: 14, right: 14),
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
                '    If disease levels were high the previous season, liquid copper fungicides can be sprayed to impede the fungal growth on the tree during the winter season. Sulfur sprays are only partially effective against apple scab. However, solutions containing sulfur and pyrethrins are available for organic control of the disease during the growing season. Always consider an integrated approach with preventive measures together with biological treatments if available. Protectant fungicides such as dodine, captan or dinathion can be sprayed around bud break to avoid the disease. Once scab has been detected, fungicides based on difenoconazole, myclobutanil or sulphur can be used to control the development of the fungus. Ensure scab fungicides from different chemical groups are used to avoid the development of resistance. ',
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
