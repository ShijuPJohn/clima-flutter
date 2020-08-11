import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Location {
  double latitude;
  double longitude;
  String url;
  http.Response response;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getLastKnownPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      url = 'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=7bf1cfe6d737bd74065dcbf7fb15cb49';
      response = await http.get(url);
    } catch (e) {
      print(e);
    }
  }
  Future<void> getData() async{
    try {
      response = await http.get(url);
    } catch (e) {
      print(e);
    }
  }


}
