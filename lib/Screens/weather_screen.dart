import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

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
  var date = DateTime.now();

  void updateData(dynamic weatherData) {
    double temp2 = weatherData['main']['temp'];
    cityName = weatherData['name'];
    temp = temp2.round();
    print(temp);
    print(cityName);
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.near_me),
          onPressed: () {},
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.location_searching))
        ],
      ),
      body: Container(
          child: Stack(
        children: [
          Image.asset(
            'image/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            padding: EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    //구분선 위
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 지명, 날짜, 시간
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 150),
                          Text(
                            'Seoul',
                            style: GoogleFonts.lato(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              TimerBuilder.periodic((Duration(minutes: 1)), builder: (context) {
                                print('${getSystemTime()}');
                                return Text(
                                  '${getSystemTime()}',
                                  style: GoogleFonts.lato(fontSize: 16.0, color: Colors.white),
                                );
                              }),
                              Text(
                                DateFormat(' - EEEE, ').format(date),
                                style: GoogleFonts.lato(fontSize: 16.0, color: Colors.white),
                              ),
                            ],
                          ),
                          Text(DateFormat('d MMM, yyy').format(date), style: GoogleFonts.lato(fontSize: 16.0, color: Colors.white)),
                        ],
                      ),

                      // 기온, 기온아이콘콘
                      Column(
                        children: [
                          Text(
                            '18\u2103',
                            style: GoogleFonts.lato(
                              fontSize: 60.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('svg/climacon-sun.svg'),
                              Text('Clear Sky', style: TextStyle(fontStyle: GoogleFonts.lato, fontSize: 16.0, color: Colors.white)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),

                Column(
                  children: [
                    Divider(
                      height: 15.0,
                      thickness: 2.0,
                      color: Colors.white,
                    ),
                    Row(
                      children: [
                        Text("미세먼지"),
                      ],
                    ),
                  ],
                ), // 구분선 아래
              ],
            ),
          )
        ],
      )),
    );
  }
}
