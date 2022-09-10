import 'package:flutter/cupertino.dart';
import 'package:weather_app/views/nameValueRow.dart';

class CurrentData {
  int sunrise;
  int sunset;
  double temp;
  double tempFeelsLike;
  int pressure;
  int humidity;

  CurrentData(this.sunrise, this.sunset, this.temp, this.tempFeelsLike,
      this.pressure, this.humidity);

  factory CurrentData.fromJson(Map<String, dynamic> json) {
    return CurrentData(json["sunrise"], json["sunset"], json["temp"],
        json["feels_like"], json["pressure"], json["humidity"]);
  }

  Widget getWidget() {
    return Column(
      children: [
        NameValueRow("sunrise", sunrise),
        NameValueRow("sunset", sunset),
        NameValueRow("tempreture", temp),
        NameValueRow("felt like", tempFeelsLike),
        NameValueRow("pressure", pressure),
        NameValueRow("humidity", humidity),
      ],
    );
  }
}
