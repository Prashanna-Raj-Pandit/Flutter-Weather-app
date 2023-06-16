import 'package:flutter/material.dart';
import 'package:weather_app/screens/city.dart';
import 'package:weather_app/screens/constants.dart';
import 'package:weather_app/weather.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../networking.dart';
class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather; // contains the whole json file
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late double temperature;
  late String condition;
  late String cityName;
  late String weatherMsg;
  late String countryName;
  @override
  void initState() {
    updateUI(widget.locationWeather);
    super.initState();
  }
  void updateUI(dynamic weatherData){
    setState(() {
      if(weatherData==null){
        temperature=0;
        condition='';
        cityName='';
        weatherMsg='';
        countryName='';
        return;
      }
      WeatherModel weatherModel=WeatherModel();
      temperature= weatherData['current']['temp_c'];
      int tem=temperature.toInt();
      condition= weatherData['current']['condition']['text'];
      cityName= weatherData['location']['name'];
      countryName= weatherData['location']['country'];
      weatherMsg=weatherModel.getMessage(tem);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColorDay,
        actions: [
          IconButton(onPressed: ()async{
           var typedName= await Navigator.push(context, MaterialPageRoute(builder: (context){
              return CityScreen();
            }));
           if(typedName!=null){
             print(typedName);
             NetworkHelper networkhepler= NetworkHelper(cityName: typedName);
             var updatedWeatherData=await networkhepler.getData();
             updateUI(updatedWeatherData);
           }
          }, icon: Icon(Icons.location_city,)),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: kPrimaryColorDay
          // image: DecorationImage(
          //   image: AssetImage('images/rain.jpeg'),
          //       fit: BoxFit.cover,
          //   colorFilter: ColorFilter.mode(Colors.grey, BlendMode.modulate)
          // )
        ),
        constraints: BoxConstraints.expand(),
        child:SafeArea(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(condition,
                style: TextStyle(
                    fontSize: 20
                ),),
              Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/lightning.png')
                  )
                ),
              ),
              // Icon(FontAwesomeIcons.cloudSun,
              // color: Colors.yellow,
              // size: 250,),
              Column(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text('$cityName,',
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                      Text(countryName,
                      style: TextStyle(
                        fontSize: 20
                      ),)
                    ],
                  ),
                  Text('$temperature°',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 70
                    ),),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
