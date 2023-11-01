import '../diseasemodel.dart';
import '../diseases/AppleBlackRot.dart';
import '../diseases/AppleCedarRust.dart';
import '../diseases/AppleScab.dart';
import '../diseases/CherrySourMildew.dart';
import '../diseases/CornCommonRust.dart';
import '../diseases/CornGrayLeaf.dart';
import '../diseases/GrapeBlackRot.dart';
import '../diseases/GrapeEsca.dart';
import '../diseases/GrapeLeafBlight.dart';
import '../diseases/NorthernCornLeafBlight.dart';
import '../diseases/OrangeCitrus.dart';
import '../diseases/PeachSpot.dart';
import '../diseases/PepperBacterialSpot.dart';
import '../diseases/PotatoEarlyBlight.dart';
import '../diseases/PotatoLateBlight.dart';
import '../diseases/SquashMildew.dart';
import '../diseases/StrawberryLeafScorch.dart';
import '../diseases/TomatoBacteriaSpot.dart';
import '../diseases/TomatoEarlyBlight.dart';
import '../diseases/TomatoLateBlight.dart';
import '../diseases/TomatoLeafMold.dart';
import '../diseases/TomatoLeafSpot.dart';
import '../diseases/TomatoMosaic.dart';
import '../diseases/TomatoSpider.dart';
import '../diseases/TomatoTarget.dart';
import '../diseases/TomatoYellow.dart';
// import '../model/diseasemodel.dart';

List<DiseasesModel> getDiseases() {
  List<DiseasesModel> list = List<DiseasesModel>.empty();
  DiseasesModel model1 = DiseasesModel();
  model1.name = "Apple Black Rot";
  model1.image = "assets/black.jpg";
  model1.tag = AppleBlack(title: "Apple Black Rot",);

  DiseasesModel model2 = DiseasesModel();
  model2.name = "Apple Cedar Rust";
  model2.image = "assets/cedar.jpg";
  model2.tag = AppleCedarRust(title: "Apple Cedar Rust",);

  DiseasesModel model3 = DiseasesModel();
  model3.name = "Apple Scab";
  model3.image = "assets/scab.jpg";
  model3.tag = AppleScab(title: "Apple Scab",);

  DiseasesModel model5 = DiseasesModel();
  model5.name = "Cherry Sour Powdery Mildew";
  model5.image = "assets/cherrysour.jpg";
  model5.tag = CherrySour(title: "Cherry Sour Powdery Mildew",);

  DiseasesModel model6 = DiseasesModel();
  model6.name = "Corn Common Rust";
  model6.image = "assets/corn.jpg";
  model6.tag = CornCommonRust(title: "Corn Common Rust",);

  DiseasesModel model7 = DiseasesModel();
  model7.name = "Corn Gray Leaf";
  model7.image = "assets/corngray.jpeg";
  model7.tag = CornGrayLeaf(title: "Corn Gray Leaf",);

  DiseasesModel model8 = DiseasesModel();
  model8.name = "Northern Corn Leaf Blight";
  model8.image = "assets/ncorn.JPG";
  model8.tag = NorthernCornLeafBlight(title: 'Northern Corn Leaf Blight',);

  DiseasesModel model9 = DiseasesModel();
  model9.name = "Grape Black Rot";
  model9.image = "assets/grapeblack.jpg";
  model9.tag = GrapeBlackRot(title: 'Grape Black Rot',);

  DiseasesModel model10 = DiseasesModel();
  model10.name = "Grape Esca";
  model10.image = "assets/esca.jpg";
  model10.tag = GrapeEsca(title: '',);

  DiseasesModel model11 = DiseasesModel();
  model11.name = "Grape Leaf Blight";
  model11.image = "assets/grapebli.jpg";
  model11.tag = GrapeLeafBlight(title: '',);


  DiseasesModel model12 = DiseasesModel();
  model12.name = "Orange Citrus Greening";
  model12.image = "assets/orange.jpg";
  model12.tag = OrangeCitrus(title: '',);

  DiseasesModel model13 = DiseasesModel();
  model13.name = "Peach Bacterial Spot";
  model13.image = "assets/peachspot1.jpg";
  model13.tag = PeachSpot(title: '',);

  DiseasesModel model14 = DiseasesModel();
  model14.name = "Pepper Bacterial Spot";
  model14.image = "assets/pepper1.jpg";
  model14.tag = PepperBacterialSpot(title: '',);

  DiseasesModel model15 = DiseasesModel();
  model15.name = "Potato Early Blight";
  model15.image = "assets/16.jpg";
  model15.tag = PotatoEarlyBlight(title: '',);

  DiseasesModel model16 = DiseasesModel();
  model16.name = "Potato Late Blight";
  model16.image = "assets/plate.jpg";
  model16.tag = PotatoLateBlight(title: '',);

  DiseasesModel model17 = DiseasesModel();
  model17.name = "Squash Powdery Mildew";
  model17.image = "assets/squash.jpg";
  model17.tag = SquashMildew(title: '',);

  DiseasesModel model18 = DiseasesModel();
  model18.name = "Strawberry Leaf Scorch";
  model18.image = "assets/straw1.jpg";
  model18.tag = StrawberryLeafScorch(title: '',);

  DiseasesModel model19 = DiseasesModel();
  model19.name = "Tomato Bacteria Spot";
  model19.image = "assets/tomato1.png";
  model19.tag = TomatoBacteriaSpot(title: '',);

  DiseasesModel model20 = DiseasesModel();
  model20.name = "Tomato Early Blight";
  model20.image = "assets/tlb.jpg";
  model20.tag = TomatoEarlyBlight(title: '',);

  DiseasesModel model21 = DiseasesModel();
  model21.name = "Tomato Late Blight";
  model21.image = "assets/latetomato.jpg";
  model21.tag = TomatoLateBlight(title: '',);

  DiseasesModel model22 = DiseasesModel();
  model22.name = "Tomato Leaf Mold";
  model22.image = "assets/mold1.jpg";
  model22.tag = TomatoLeafMold(title: '',);

  DiseasesModel model23 = DiseasesModel();
  model23.name = "Tomato Septoria Leaf Spot";
  model23.image = "assets/tomatospot2.jpeg";
  model23.tag = TomatoLeafSpot(title: '',);

  DiseasesModel model24 = DiseasesModel();
  model24.name = "Tomato spider mites";
  model24.image = "assets/spider.jpg";
  model24.tag = TomatoSpider(title: '',);

  DiseasesModel model25 = DiseasesModel();
  model25.name = "Tomato Target Spot";
  model25.image = "assets/target2.jpg";
  model25.tag = TomatoTarget(title: '',);

  DiseasesModel model26 = DiseasesModel();
  model26.name = "Tomato Yellow Leaf Curl Virus";
  model26.image = "assets/curl.png";
  model26.tag = TomatoYellow(title: '',);

  DiseasesModel model27 = DiseasesModel();
  model27.name="Tomato Mosaic Virus";
  model27.image="assets/mosaic2.jpg";
  model27.tag= TomatoMosaic(title: '',);

  

  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model5);
  list.add(model6);
  list.add(model7);
  list.add(model8);
  list.add(model9);
  list.add(model10);
  list.add(model11);
  list.add(model12);
  list.add(model13);
  list.add(model14);
  list.add(model15);
  list.add(model16);
  list.add(model17);
  list.add(model18);
  list.add(model19);
  list.add(model20);
  list.add(model21);
  list.add(model22);
  list.add(model23);
  list.add(model24);
  list.add(model25);
  list.add(model26);
  list.add(model27);
  return list;
}

