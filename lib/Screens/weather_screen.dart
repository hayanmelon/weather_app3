import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData});
  // 왜 생성자에 컬리브레이스를 하지?
  //
  final parseWeatherData;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.parseWeatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'City Name',
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'City Name',
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
        ],
      ),
    )));
  }
}
