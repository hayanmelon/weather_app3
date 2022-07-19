import 'package:geolocator/geolocator.dart' as geo;


class MyLocation{
  double? latitude2;
  double? longitude2;

  Future<void> getMyCurrentLocation() async {
    try {
      geo.Position position = await geo.Geolocator.
      getCurrentPosition(desiredAccuracy: geo.LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
      print(latitude2);
      print(longitude2);
    }catch(e){
      print('인터넷 연결에 문제가 발생했습니다.');
    }  }
}