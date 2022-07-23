import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Network {
  final String url;
  Network(this.url);

  Future<dynamic> getJsonData() async {
    print('-- getJsonData 시작 -- ');
    print(Uri.parse(url));
    http.Response response = await http.get(Uri.parse(url), headers: {
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    });
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    } else {
      var jsonText = await rootBundle.loadString('assets/shop.json');
      var parsingData = jsonDecode(jsonText);
      return parsingData;
    }
  }
}
