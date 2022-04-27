import 'package:flutter/material.dart';

Color? getMaterialColor(String colorString) {
  switch (colorString) {
    case "green":
      return Colors.green;
    case "amber":
      return Colors.amber;
    default:
      return Colors.brown[50];
  }
}
