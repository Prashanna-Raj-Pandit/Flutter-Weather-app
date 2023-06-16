import 'package:flutter/material.dart';

class WeatherModel {
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
  String imageSelect( String cond){
    if(cond=='Sunny'){
      return 'images/rain.jpeg';
    }else if(cond=='Partly cloudy'){
      return 'images/rain.jpeg';
    }else if(cond=='Clear'){
      return 'images/rain.jpeg';
    }else if(cond=='Rainy'){
      return 'images/rain.jpeg';
    }else
      return 'images/rain.jpeg';
  }
}
