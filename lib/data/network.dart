import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String url;
  Network(this.url);

  Future<dynamic> getJsonData() async {
    print('-- getJsonData 시작 -- ');
    http.Response response = await http.get(Uri.parse(url), {
      headers: 'headers'
    });
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    } else {
      print(response.statusCode);
    }
  }
}
