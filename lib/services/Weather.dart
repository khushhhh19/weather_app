import 'Location.dart';
import 'Networking.dart';

const apiKey = 'e0552c19a1055301c456967db79defc2';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(url: '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(url: '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if(condition < 300) {
      return '🌩';
    }
    else if(condition < 400) {
      return '🌨‍';
    }
    else if(condition < 600) {
      return '☔';
    }
    else if(condition < 700) {
      return '☃';
    }
    else if(condition < 800) {
      return '☀';
    }
    else if(condition == 800) {
      return '☀';
    }
    else if(condition <= 804) {
      return '☁';
    }
    else {
      return '🤷';
    }
  }

  String getMessage(int temp) {
    if(temp > 25) {
      return 'It is ice-cream 🍦 time';
    }
    else if(temp > 20) {
      return 'Time for shorts and t-shirt 👕';
    }
    else if(temp < 10) {
      return 'You will need jacket and cap';
    }
    else {
      return 'Bring a coat 🧥 just in case';
    }
  }

}