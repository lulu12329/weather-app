import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weatherData.dart';

class Backend {
  static final Backend _instance = Backend._internal();
  final String serverAddress =
      "https://api.openweathermap.org/data/3.0/onecall?";
  String token = "25621aa86a40786ea93e64ee68eb2e2b"; //flutter weather app
  static final http.Client httpClient = http.Client();

  Backend._internal();

  factory Backend() {
    return _instance;
  }

  Future<WeatherData> getWeatherData(double lat, double lon) async {
    http.Response res = await get("lat=$lat&lon=$lon&appid=$token");
    Map<String, dynamic> decodedBody = json.decode(res.body);
    return WeatherData.fromJson(decodedBody);
  }

  Future<http.Response> post(String path, Map<String, dynamic> body) {
    if (token == "") throw new Exception();

    Uri uri = Uri.http("bearer:@$serverAddress", "/path");
    return httpClient.post(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: token
      },
      body: body,
    );
  }

  Future<http.Response> get(String path) async {
    if (token == "") throw new Exception('token not set Exception');

    String address = serverAddress + path;
    Uri uri = Uri.parse(address);

    var res = await httpClient
        .get(uri, headers: {HttpHeaders.contentTypeHeader: "application/json"});
    return res;
  }
}
