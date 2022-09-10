import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'nameValueRow.dart';

class LocationInfo extends StatelessWidget {
  final Position pos;
  LocationInfo(this.pos);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("LocationInfo"),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new NameValueRow(
                "longitude", this._roundDouble(pos.longitude, 6).toString()),
            new NameValueRow(
                "latitude", this._roundDouble(pos.latitude, 6).toString()),
            new NameValueRow(
                "altitude", this._roundDouble(pos.altitude, 6).toString()),
            new NameValueRow(
              "accuracy",
              this._roundDouble(pos.accuracy, 6).toString(),
              unit: "[m]",
            ),
          ],
        ),
      ],
    );
  }

  double _roundDouble(double value, int decimalPlaces) {
    num i = pow(10, decimalPlaces);
    return ((value * i).roundToDouble() / i);
  }
}
