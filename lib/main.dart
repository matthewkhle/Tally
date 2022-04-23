import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
import 'package:tally/screens/home.dart';
import 'package:tally/screens/loading.dart';
import 'package:tally/screens/scoreboard/scoreboard.dart';
import 'package:tally/screens/scoreboard/scoreboard_settings.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/scoreboard': (context) => Scoreboard(),
      '/scoreboard_settings': (context) => ScoreboardSettings(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
