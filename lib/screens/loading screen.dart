
import 'package:flutter/material.dart';
import 'package:weather_app/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_app/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';
const apiKey='2345cd2aef8d62a1dff5f39d2eb3a533';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);


  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  late double latitude,longitude;
  @override
  void initState(){
    super.initState();
    getLocationData();
  }
  void getLocationData() async{
    Location location=Location();
    await location.getCurrentLocation();
    latitude=location.latitude;
    longitude=location.longitude;
    NetworkHelper networkHelper=NetworkHelper(cityName: 'Kathmandu');

    var weatherData= await networkHelper.getData(); //weatherData contains the whole jso file
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);
    }));

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
