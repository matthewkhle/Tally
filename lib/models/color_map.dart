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

// var colorStrings = ["Blue", "Red", "Green", "Amber", "Grey"];
// var materialColors = [
//   Colors.blue,
//   Colors.red,
//   Colors.green,
//   Colors.amber,
//   Colors.grey
// ];

// var colors = {
//   "Green": {
//     "String": "Green",
//     "MaterialColor": Colors.green,
//   },
//   "Amber": {
//     "String": "Amber",
//     "MaterialColor": Colors.amber,
//   },
// };

// Color? getMaterialColor(String colorString) {
//   for (var customColorObject in customColorObjects) {
//     if (customColorObject.string == colorString) {
//       return customColorObject.materialColor;
//     }
//   }
//
//   if (colorString == "Green") {
//     return Colors.green;
//   } else if (colorString == "Amber") {
//     return Colors.amber;
//   } else if (colorString == "Blue") {
//     return Colors.blue;
//   } else if (colorString == "Red") {
//     return Colors.red;
//   } else if (colorString == "Grey") {
//     return Colors.grey;
//   }
//
//   return Colors.brown;
// }


// String getColorString(MaterialColor materialColor) {
//   if (materialColor == Colors.green) {
//     return "Green";
//   } else if (materialColor == Colors.amber) {
//     return "Amber";
//   } else if (materialColor == Colors.blue) {
//     return "Blue";
//   } else if (materialColor == Colors.red) {
//     return "Red";
//   } else if (materialColor == Colors.grey) {
//     return "Grey";
//   }
//
//   return "brown";
// }