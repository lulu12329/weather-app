import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weatherData.dart';
import 'package:weather_app/utils/backend.dart';
import 'package:weather_app/views/currentWeatherView.dart';
import 'package:weather_app/views/locationInfo.dart';

class PositionInformation extends StatefulWidget {
  final Position position;
  PositionInformation(this.position);

  @override
  _PositionInformationState createState() => _PositionInformationState();
}

class _PositionInformationState extends State<PositionInformation> {
  List _sections = [];
  WeatherData? _weatherData;
  Backend backend = new Backend();

  @override
  void initState() {
    super.initState();
    getWeatherData(widget.position);
  }

  getWeatherData(Position pos) async {
    WeatherData data =
        await backend.getWeatherData(pos.latitude, pos.longitude);
    setState(() {
      _weatherData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    createSections();
    return ListView.separated(
        itemBuilder: _buildSection,
        separatorBuilder: _buildDivider,
        itemCount: _sections.length);
  }

  Widget _buildSection(BuildContext context, int index) {
    return Card(
        elevation: 10,
        surfaceTintColor: Colors.grey,
        child: Container(
          margin: EdgeInsets.all(10),
          child: _sections[index],
        ));
  }

  Widget _buildDivider(BuildContext context, int index) {
    return Divider(thickness: 2, color: Colors.cyan);
  }

  createSections() {
    List<Widget> sections = [];
    if (_weatherData != null) sections.add(CurrentWeatherView(_weatherData!));
    sections.add(LocationInfo(widget.position));

    setState(() {
      _sections = sections;
    });
  }
}
