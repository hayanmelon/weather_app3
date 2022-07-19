import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:weatherapp/data/my_location.dart';
import 'dart:convert';
import 'package:weatherapp/data/my_location.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  double? latitude2;
  double? longitude2;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    fetchData();
  }

  void getLocation() async{
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
  }

  void fetchData() async {
    try {
      var url = Uri.parse(
          'https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1');
      http.Response response = await http.get(url);
      if (response.statusCode == 200){
        String jsonData = response.body;
        var myJson = jsonDecode(jsonData)['weather'][0]['description'];
        print(myJson);
        myJson = jsonDecode(jsonData)['wind']['speed'];
        print(myJson);
        myJson = jsonDecode(jsonData)['id'];
        print(myJson);
      }else{
        print(response.statusCode);
      }
    }catch(e){
      print('인터넷 파싱에 실패하였습니다');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
      child: Text('Button'),
      onPressed: () {
        print('preesed');
      },
    )));
  }
}

