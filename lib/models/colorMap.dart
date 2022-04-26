import 'package:flutter/material.dart';

class ColorMap {
  static Color? toMaterialColor(String colorString) {
    switch (colorString) {
      case "green":
        return Colors.green;
      case "amber":
        return Colors.amber;
      default:
        return Colors.brown[50];
    }
  }
}
