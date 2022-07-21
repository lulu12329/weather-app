import 'package:weather_app/utils/geodata.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class Backend {
  static final Backend _instance = Backend._internal();
  final String serverAddress =
      "https://api.openweathermap.org/data/3.0/onecall?";
  String token = "5c235c4cca8c7690be31e4c4f4f2e599";
  static final http.Client httpClient = http.Client();

  Backend._internal();

  factory Backend() {
    return _instance;
  }

  getWeatherData(double lat, double lon) {
    return get("lat=$lat&lon=$lon&appid={API $token}");
  }

  /* getDataForCurrentPosition() async {
    Position? position = await Geodata().getPosition();
    return getWeatherData(position.latitude, position.longitude);
  } */

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

    return await httpClient.get(uri, headers: {
      HttpHeaders.contentTypeHeader:
          "application/json" /* ,
      HttpHeaders.authorizationHeader: token */
    });
  }
}
