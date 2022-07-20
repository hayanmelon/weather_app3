import 'package:flutter/material.dart';
import 'package:weatherapp/data/network.dart';
import 'package:weatherapp/data/my_location.dart';
import 'package:weatherapp/Screens/weather_screen.dart';

const apikey = '060d5920c116d33cba156d0b8664cb37';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double? latitude3;
  double? longitude3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network('https://api.openweathermap.org/data/2.5/weather?'
        'lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric');

    var weatherData = await network.getJsonData();
    print(weatherData);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
        parseWeatherData: weatherData,
      );
    }));
  }

  // void fetchData() async {
  //   try {
  //
  //       var myJson = parsingData['weather'][0]['description'];
  //       print(myJson);
  //       myJson = parsingData['wind']['speed'];
  //       print(myJson);
  //       myJson = parsingData['id'];
  //       print(myJson);
  //     }else{
  //       print(response.statusCode);
  //     }
  //   }catch(e){
  //     print('인터넷 파싱에 실패하였습니다');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
      child: Text('Button'),
      onPressed: () {
        print('preesed');
        getLocation();
      },
    )));
  }
}
