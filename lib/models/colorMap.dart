import 'package:flutter/material.dart';

class ColorMap {
  Color? toMaterialColor(String colorString) {
    switch(colorString) {
      case "green":
        return Colors.green;
      case "amber":
        return Colors.amber;
      default:
        return Colors.brown[50];
    }

  }
}