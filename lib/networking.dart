import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class NetworkHelper{
  NetworkHelper({required this.cityName});
  String cityName='Kathmandu';
  Future getData() async{
    //final Uri url= Uri.parse('https://api.openweathermap.org/data/3.0/onecall?lat=$latitude&lon=$longitude&appid=2345cd2aef8d62a1dff5f39d2eb3a533');

    final Uri url= Uri.parse('http://api.weatherapi.com/v1/current.json?key=8efe2488d9b14e6a94252924232305&q=$cityName&aqi=no');

    http.Response response =await http.get(url);
    if(response.statusCode==200){
      String data= response.body;
      return jsonDecode(data);
  }else {
      print(response.statusCode);
    }
}}