import 'package:flutter/cupertino.dart';
import 'package:weather_app/views/nameValueRow.dart';

class WeatherAlert {
  String sender;
  String event;
  int start;
  int end;
  String description;

  WeatherAlert(this.sender, this.event, this.start, this.end, this.description);

  factory WeatherAlert.fromJson(Map<String, dynamic> json) {
    return WeatherAlert(
        json["sender_name"].toString(),
        json["event"].toString(),
        json["start"],
        json["end"],
        json["description"]);
  }

  static List<WeatherAlert> getWeatherAlertsFromList(List<dynamic> list) {
    List<WeatherAlert> alerts =
        list.map((i) => WeatherAlert.fromJson(i)).toList();
    return alerts;
  }

  Widget getAsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(event),
        Column(
          children: [
            NameValueRow("description", description),
            NameValueRow("from", start.toString()),
            NameValueRow("to", end.toString()),
            NameValueRow("sender", sender.toString())
          ],
        )
      ],
    );
  }
}
