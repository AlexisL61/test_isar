import 'package:flutter/material.dart';

class ColorParser {
  static Color parseHexColor(final String hexColor) {
    var localHexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (localHexColor.length == 6) {
      localHexColor = "FF$localHexColor";
    }
    var intColor = int.parse(localHexColor, radix: 16);
    return Color(intColor);
  }
}

class DurationParser {
  static Duration? parseSeconds(final dynamic seconds) {
    if (seconds == null) {
      return null;
    }
    if (seconds is int) {
      return Duration(seconds: seconds);
    }
    return Duration(seconds: seconds.toInt());
  }
}
