import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const appid = '7bf1cfe6d737bd74065dcbf7fb15cb49';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    String url =
        '$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$appid&units=metric';
    NetworkHelper network = NetworkHelper(url);
    var weatherData = await network.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    String url =
        '$openWeatherURL?q=$cityName&appid=$appid&units=metric';
    NetworkHelper network = NetworkHelper(url);
    var weatherData = await network.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
