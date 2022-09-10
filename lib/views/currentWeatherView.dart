import 'package:flutter/material.dart';
import 'package:weather_app/models/currentData.dart';
import 'package:weather_app/models/weatherAlert.dart';
import 'package:weather_app/models/weatherData.dart';
import 'nameValueRow.dart';

class CurrentWeatherView extends StatelessWidget {
  final WeatherData data;
  CurrentWeatherView(this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("WeatherData"), displayWeatherData(data)],
    );
  }

  Widget displayWeatherData(WeatherData weatherData) {
    return Column(
      children: [
        weatherData.current.getWidget(),
        // weatherData.daily,
        displayAlerts(weatherData.alerts)
      ],
    );
  }

  Widget displayAlerts(List<WeatherAlert> alerts) {
    List<Widget> entrys = [];
    alerts.forEach((alert) => entrys.add(alert.getAsWidget()));

    return Column(children: entrys);
  }
}
