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
  String? cityName;
  int? temp;

  void updateData(dynamic weatherData) {
    double temp2 = weatherData['main']['temp'];
    cityName = weatherData['name'];
    temp = temp2.round();
    print(temp);
    print(cityName);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title : Text('image2 '),
      ),
      body : Container(
        child : Stack(
          children: [
            Image.asset('image/background.jpg',
            fit : BoxFit.cover,
            width : double.infinity,
              height: double.infinity,
            ),
          ],
        )
      ),
    );
  }
}
