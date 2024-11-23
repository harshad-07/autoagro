import 'package:flutter/material.dart';

import 'diseases/AppleBlackRot.dart';
import 'diseases/AppleCedarRust.dart';
import 'diseases/AppleScab.dart';
import 'diseases/CherrySourMildew.dart';
import 'diseases/CornCommonRust.dart';
import 'diseases/CornGrayLeaf.dart';
import 'diseases/GrapeBlackRot.dart';
import 'diseases/GrapeEsca.dart';
import 'diseases/GrapeLeafBlight.dart';
import 'diseases/Healthy.dart';
import 'diseases/NorthernCornLeafBlight.dart';
import 'diseases/OrangeCitrus.dart';
import 'diseases/PeachSpot.dart';
import 'diseases/PepperBacterialSpot.dart';
import 'diseases/PotatoEarlyBlight.dart';
import 'diseases/PotatoLateBlight.dart';
import 'diseases/SquashMildew.dart';
import 'diseases/StrawberryLeafScorch.dart';
import 'diseases/TomatoBacteriaSpot.dart';
import 'diseases/TomatoEarlyBlight.dart';
import 'diseases/TomatoLateBlight.dart';
import 'diseases/TomatoLeafMold.dart';
import 'diseases/TomatoLeafSpot.dart';
import 'diseases/TomatoMosaic.dart';
import 'diseases/TomatoSpider.dart';
import 'diseases/TomatoTarget.dart';
import 'diseases/TomatoYellow.dart';

void showErrorProcessing(BuildContext context, String message) {
  AlertDialog dialogWithImage = AlertDialog(
    backgroundColor: Colors.white,
    content: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container(height: 120, color: Colors.red.shade400),
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            color: Colors.red.shade400,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.warning, color: Colors.white, size: 32),
                SizedBox(height: 8),
                Text('OOPs...',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              message,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          // ElevatedButton(
          //   onPressed: () {
          //     // Navigator.pop(context);
          //   },
          //   child: Text("Try again",
          //       style: TextStyle(color: Colors.white, fontSize: 16.0)),
          // ),
          GestureDetector(
            onTap: () {
              // Navigator.of(context).pop();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: const Text("Try again",
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    ),
    contentPadding: const EdgeInsets.all(0),
  );
  showDialog(
      context: context, builder: (BuildContext context) => dialogWithImage);
}

void resultPage(BuildContext context, String name) {
  if (name == "apple apple scab") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const AppleScab(
                title: "Apple Black Rot",
              )),
    );
  } else if (name == "apple black rot") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const AppleBlack(title: "Apple Cedar Rust")),
    );
  } else if (name == "apple cedar apple rust") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const AppleCedarRust(
                title: "Apple Cedar Rust",
              )),
    );
  } else if (name == "cherry including sour powdery mildew") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              const CherrySour(title: "Cherry Sour Powdery Mildew")),
    );
  } else if (name == "corn maize cercospora leaf spot gray leaf spot") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const CornGrayLeaf(
                title: "Corn Gray Leaf",
              )),
    );
  } else if (name == "corn maize common rust") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const CornCommonRust(title: "Corn Common Rust")),
    );
  } else if (name == "corn maize northern leaf blight") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const NorthernCornLeafBlight(
                title: 'Northern Corn Leaf Blight',
              )),
    );
  } else if (name == "grape black rot") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const GrapeBlackRot(title: 'Grape Black Rot')),
    );
  } else if (name == "grape esca black measles") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const GrapeEsca(
                title: '',
              )),
    );
  } else if (name == "grape leaf blight isariopsis leaf spot") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const GrapeLeafBlight(
                title: '',
              )),
    );
  } else if (name == "orange haunglongbing citrus greening") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const OrangeCitrus(
                title: '',
              )),
    );
  } else if (name == "peach bacterial spot") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const PeachSpot(
                title: '',
              )),
    );
  } else if (name == "pepper bell bacterial spot") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const PepperBacterialSpot(
                title: '',
              )),
    );
  } else if (name == "potato early blight") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const PotatoEarlyBlight(
                title: '',
              )),
    );
  } else if (name == "potato late blight") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const PotatoLateBlight(
                title: '',
              )),
    );
  } else if (name == "squash powdery mildew") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SquashMildew(
                title: '',
              )),
    );
  } else if (name == "strawberry leaf scorch") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const StrawberryLeafScorch(
                title: '',
              )),
    );
  } else if (name == "tomato bacterial spot") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const TomatoBacteriaSpot(
                title: '',
              )),
    );
  } else if (name == "tomato early blight") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const TomatoEarlyBlight(
                title: '',
              )),
    );
  } else if (name == "tomato late blight") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const TomatoLateBlight(
                title: '',
              )),
    );
  } else if (name == "tomato leaf mold") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const TomatoLeafMold(
                title: '',
              )),
    );
  } else if (name == "tomato septoria leaf spot") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const TomatoLeafSpot(
                title: '',
              )),
    );
  } else if (name == "ttomato spider mites two spotted spider mite") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const TomatoSpider(
                title: '',
              )),
    );
  } else if (name == "tomato target spot") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const TomatoTarget(
                title: '',
              )),
    );
  } else if (name == "tomato tomato yellow leaf curl virus") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const TomatoYellow(
                title: '',
              )),
    );
  } else if (name == "tomato tomato mosaic virus") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const TomatoMosaic(
                title: '',
              )),
    );
  } else if (name == "apple healthy" ||
      name == "blueberry healthy" ||
      name == "cherry including sour healthy" ||
      name == "corn maize healthy" ||
      name == "grape healthy" ||
      name == "peach healthy" ||
      name == "pepper bell healthy" ||
      name == "potato healthy" ||
      name == "raspberry healthy" ||
      name == "soybean healthyy" ||
      name == "strawberry healthy" ||
      name == "tomato healthy") {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const Healthy(
                title: '',
              )),
    );
  } else {
    showErrorProcessing(context,
        'We encountered a issue while processing!\nTip: Please make sure you take the image up close and with proper lighting.');
  }
}

void showCustomDialogWithImage(BuildContext context, var labelForHighest) {
  Dialog dialogWithImage = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0)),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            child: Image(
                width: MediaQuery.of(context).size.width,
                image: const AssetImage('assets/widget_delete.jpg'),
                height: 120,
                fit: BoxFit.cover),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text(
                "  We are not sure with the disease .\n Do you still wish to check the disease?",
                style: TextStyle(color: Color(0xFF5A5C5E))),
          ),
          const SizedBox(height: 16),
          const Text('Continue?',
              style: TextStyle(color: Color(0xFF212121), fontSize: 18)),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      // bgColor: Color(0xFFFFFFFF)
                    ),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const WidgetSpan(
                                child: Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Icon(Icons.close,
                                        color: Colors.blueAccent, size: 18))),
                            TextSpan(
                                text: "No",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.indigo.shade700,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                    // .onTap(() {
                    //   Navigator.pop(context);
                    // }),
                    ),
                const SizedBox(width: 16),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    resultPage(context, labelForHighest);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.indigo.shade700,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            WidgetSpan(
                                child: Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Icon(Icons.check,
                                        color: Colors.white, size: 18))),
                            TextSpan(
                                text: "Yes",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                    // .onTap(() {
                    //   Navigator.pop(context);
                    //   resultPage(context, labelForHighest);
                    // }),
                    )
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    ),
  );
  showDialog(
      context: context, builder: (BuildContext context) => dialogWithImage);
}
