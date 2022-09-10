import 'package:weather_app/models/currentData.dart';
import 'package:weather_app/models/weatherAlert.dart';

class WeatherData {
  CurrentData current;
  dynamic daily;
  List<WeatherAlert> alerts;

  WeatherData(this.current, this.daily, this.alerts);

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    List<dynamic>? alertsJsonList = json["alerts"] as List?;
    List<WeatherAlert> alerts = List.empty();
    if (alertsJsonList != null)
      alerts = WeatherAlert.getWeatherAlertsFromList(alertsJsonList);

    CurrentData current = CurrentData.fromJson(json["current"]);

    return WeatherData(current, json["daily"], alerts);
  }
}
