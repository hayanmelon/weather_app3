import 'package:flutter/cupertino.dart';

class WeatherScreen extends StatefulWidget {
import'package:flutter/material.dart';
  const WeatherScreen({Key? key}) : super(key: key);
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body : SafeArea(
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('City Name', 
              style: TextStyle(
                fontSize: 30.0,
              ),),
              
              SizedBox(height: 20.0),

              Text('City Name', 
              style: TextStyle(
                fontSize: 30.0,
              ),),
            ],
          ),))
          )
    );
  }
}
