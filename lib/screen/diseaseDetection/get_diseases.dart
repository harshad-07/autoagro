import 'data/disease_data.dart';
import 'diseasemodel.dart';

List<DiseasesModel>? diseaseList;

Future<void> fetchList() async {
  diseaseList = getDiseases();
}