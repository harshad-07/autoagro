import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:easy_image_viewer/easy_image_viewer.dart';

import 'package:image/image.dart' as img;
import 'package:tflite_v2/tflite_v2.dart';
import 'utils.dart';

class DiseaseDetection extends StatefulWidget {
  const DiseaseDetection({super.key});

  @override
  State<DiseaseDetection> createState() => _DiseaseDetectionState();
}

class _DiseaseDetectionState extends State<DiseaseDetection> {
  File? image;

  final imagePicker = ImagePicker();

  List _recognitions = List.empty();

  @override
  void initState() {
    loadModel(); //Model is loaded when app is started
    super.initState();
  }

  //loading ML model
  Future<void> loadModel() async {
    debugPrint("DEBUG: Inside Load Model Function");
    try {
      final String? res = await Tflite.loadModel(
        model: 'assets/plant_disease_model.tflite',
        labels: 'assets/disease_labels.txt',
      );
      debugPrint(res);
    } on PlatformException {
      debugPrint('Failed to load model.');
      showErrorProcessing(context,
          'We encountered a issue while processing!\nTip: Please make sure you take the image up close and with proper lighting.');
    }
  }

//   Basically when user gives app an image, app will have to
//   resize it first to 299, 299, 3
//   divide the image by 255.0 (for normalizing it)
//   and then resize it again to (1, 299, 299, 3),
//   and then app can give it to ML model
  Uint8List imageToByteListFloat32(
      img.Image image, int inputSize, double mean, double std) {
    var convertedBytes =
        Float32List(1 * inputSize * inputSize * 3); //resizing the image
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        final pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = (img.getRed(pixel) - mean) / std;
        buffer[pixelIndex++] = (img.getGreen(pixel) - mean) / std;
        buffer[pixelIndex++] = (img.getBlue(pixel) - mean) / std;
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

  //image recognition function
  Future<void> recognizeImage(File image) async {
    debugPrint("DEBUG: Inside Recognize Image Function");

    try {
      try {
        Uint8List bytes = image.readAsBytesSync();
        img.Image? oriImage = img.decodeImage(bytes);
        debugPrint('decoding image check');
        if (oriImage != null) {
          img.Image resizedImage =
              img.copyResize(oriImage, width: 299, height: 299);
          debugPrint('resized image check');

          //
          final recognitions = await Tflite.runModelOnBinary(
              binary: imageToByteListFloat32(resizedImage, 299, 0, 255.0),
              numResults: 39,
              threshold: 0.6,
              asynch: true);

          setState(() {
            _recognitions = recognitions!;
          });
        } else {
          // Handle image decoding error
          debugPrint('Image decoding error: Image is null.');
        }
      } catch (e) {
        // Handle exceptions that may occur during image processing or inference
        debugPrint('Error during image processing: $e');
      }

      Future<void>.delayed(Duration(seconds: 4)).then((onValue) {
        debugPrint('procceding after pr close');

        if (_recognitions.isNotEmpty) {
          String labelForHighest = '';
          double confidence = 0.0; // Initialize to 0.0 instead of -1.0
          debugPrint('inside recognition2');

          for (int i = 0; i < _recognitions.length; i++) {
            debugPrint('inside recognition');
            debugPrint(
                _recognitions[i].toString()); // Convert the map to a string
            double currentConfidence = _recognitions[i]['confidence'];

            if (currentConfidence > confidence) {
              labelForHighest = _recognitions[i]['label'];
              confidence = currentConfidence;
            }
          }

          debugPrint(labelForHighest);
          debugPrint('$confidence');

          if (confidence > 0.60) {
            resultPage(context, labelForHighest);
          } else {
            showCustomDialogWithImage(context, labelForHighest);
            debugPrint(labelForHighest);
          }
        } else {
          showErrorProcessing(context,
              'Error in Recognition\nPlease try to take CLEAR picture of the leaf');
          debugPrint('error in recognition');
        }
      });
    } on Exception {
      showErrorProcessing(context, 'huge error');
    }
  }

  Future<void> predictImage(File image) async {
    debugPrint("DEBUG: Inside Predict Image Function");

    await recognizeImage(image);
  }

  Future<void> getImage(ImageSource source) async {
    try {
      final image = await imagePicker.pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Failed to pick image $e"),
      ));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 36, 18),
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
            padding: EdgeInsets.all(32),
            child: Column(
              children: [
                SizedBox(height: 38),
                image != null
                    ? GestureDetector(
                        onTap: () {
                          showImageViewer(context, Image.file(image!).image,
                              swipeDismissible: false);
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              image!,
                              width: 220,
                              height: 220,
                              fit: BoxFit.cover,
                            )),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(55),
                        child: Image.asset('assets/images/logo.jpeg',
                            height: 220, width: 220, fit: BoxFit.cover)),
                SizedBox(
                  height: 42,
                ),
                Row(
                  children: [
                    SizedBox(width: 32),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade800,
                            textStyle: TextStyle(fontSize: 20)),
                        // onPressed: () {pickimage_gallery();},
                        onPressed: () => getImage(ImageSource.gallery),
                        icon: Icon(Icons.photo),
                        label: Text("Gallery")),
                    SizedBox(width: 38),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade800,
                            textStyle: TextStyle(fontSize: 20)),
                        // onPressed: () {pickimage_camera();},
                        onPressed: () => getImage(ImageSource.camera),
                        icon: Icon(Icons.camera_alt),
                        label: Text("Camera")),
                  ],
                ),
                SizedBox(height: 22),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade800,
                        textStyle: TextStyle(fontSize: 20)),
                    // onPressed: () {},
                    onPressed: () => predictImage(image!),
                    icon: Icon(Icons.energy_savings_leaf),
                    label: Text("Detect")),
              ],
            )),
      ),
    );
  }
}
