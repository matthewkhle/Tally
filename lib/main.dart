import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tally/models/game_arguments.dart';
// ignore_for_file: prefer_const_constructors
import 'package:tally/screens/home.dart';
import 'package:tally/screens/loading.dart';
import 'package:tally/screens/scoreboard/main_area/scoreboard.dart';
import 'package:tally/screens/scoreboard/settings/scoreboard_settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/scoreboard_settings': (context) => ScoreboardSettings(),
    },
    onGenerateRoute: (settings) {
      if (settings.name == "/scoreboard") {
        final args = settings.arguments as GameArguments;
        return MaterialPageRoute(
          builder: (context) {
            return Scoreboard(gameId: args.gameId);
          },
        );
      }
    },
    debugShowCheckedModeBanner: false,
  ));
}
