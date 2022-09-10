import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class NameValueRow extends StatelessWidget {
  final String name;
  final dynamic value;
  final String? unit;
  NameValueRow(this.name, this.value, {this.unit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name + (unit != null ? " $unit" : "")),
        Text(value.toString())
      ],
    );
  }
}
