import 'package:flutter/material.dart';

class CustomColorObject {
  String string;
  MaterialColor materialColor;

  CustomColorObject({required this.string, required this.materialColor});
}

var customColorObjects = [
  CustomColorObject(string: "Blue", materialColor: Colors.blue),
  CustomColorObject(string: "Red", materialColor: Colors.red),
  CustomColorObject(string: "Green", materialColor: Colors.green),
  CustomColorObject(string: "Amber", materialColor: Colors.amber),
  CustomColorObject(string: "Orange", materialColor: Colors.orange),
  CustomColorObject(string: "Pink", materialColor: Colors.pink),
  CustomColorObject(string: "Indigo", materialColor: Colors.indigo),
  CustomColorObject(string: "Grey", materialColor: Colors.grey),
];

Color? getMaterialColor(String colorString) {
  for (var customColorObject in customColorObjects) {
    if (customColorObject.string == colorString) {
      return customColorObject.materialColor;
    }
  }
  return null;
}

String getColorString(MaterialColor materialColor) {
  for (var customColorObject in customColorObjects) {
    if (customColorObject.materialColor == materialColor) {
      return customColorObject.string;
    }
  }

  return "brown";
}

CustomColorObject getCustomColorObject(String colorString) {
  for (var customColorObject in customColorObjects) {
    if (customColorObject.string == colorString) {
      return customColorObject;
    }
  }

  return CustomColorObject(string: "error: brown", materialColor: Colors.brown);
}
