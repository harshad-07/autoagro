// import 'package:autoagro_draft/api/fetch_weather.dart';
// import 'package:autoagro_draft/models/weatherAPI/weather_data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../api/fetch_weather.dart';
import '../model/weatherAPI/weather_data.dart';

class GlobalController extends GetxController {
  // variables
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  final RxInt _currentIndex = 0.obs;

  final weatherData = WeatherData().obs;


  // instances
  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  WeatherData getWeatherData(){
    return weatherData.value;
  }

  RxInt getCurrentIndex() => _currentIndex;


  // functions
  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }else{
      getCurrentIndex();
    }

    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission permission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      // _isLoading.value = false;
      return Future.error("Location Not Enabled");
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.deniedForever) {
      // _isLoading.value = false;
      return Future.error("Location Permission Denied Forever!");
    } else if (permission == LocationPermission.denied) {
      // _isLoading.value = false;
      // return Future.error("Location Permission Denied!");
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // _isLoading.value = false;
        return Future.error("Location Permission is Denied!");
      }
    }

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;

      return FetchWeatherAPI()
          .processData(value.latitude, value.longitude)
          .then((value) {
            weatherData.value = value;
            _isLoading.value = false;
          });
    });
  }
}
