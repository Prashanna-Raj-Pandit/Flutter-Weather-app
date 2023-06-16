import 'package:flutter/material.dart';
import 'package:weather_app/networking.dart';
import 'package:weather_app/networking.dart';
import 'package:weather_app/screens/constants.dart';
class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColorDay,
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xff5993B7FF)),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  onChanged: (value){
                    cityName=value;

                  },
                  style: TextStyle(
                    color: Color(0xff258ed0),
                  ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.white,
                      ),
                      hintText: 'Enter city name',
                      hintStyle: TextStyle(
                        color: Color(0xffff8ED0FF),
                      )),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context,cityName);
                  },
                  child: Text(
                    'Get Weather',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
