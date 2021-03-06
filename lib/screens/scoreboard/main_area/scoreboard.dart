import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tally/models/team.dart';
import 'package:tally/screens/scoreboard/main_area/game_code.dart';
import 'package:tally/screens/scoreboard/main_area/home_button.dart';
import 'package:tally/screens/scoreboard/main_area/settings_button.dart';
import 'package:tally/screens/scoreboard/main_area/tiles.dart';
import 'package:tally/services/database.dart';

// ignore_for_file: prefer_const_constructors

class Scoreboard extends StatefulWidget {
  final String gameId;

  const Scoreboard({Key? key, required this.gameId}) : super(key: key);

  @override
  _ScoreboardState createState() => _ScoreboardState();
}

class _ScoreboardState extends State<Scoreboard> {
  String? swipeDirection;
  int team1Score = 0;
  int team2Score = 0;

  @override
  Widget build(BuildContext context) {
    final DatabaseService gameData = DatabaseService(gameId: widget.gameId);
    return StreamProvider<List<Team>?>.value(
      value: DatabaseService(gameId: widget.gameId).game,
      initialData: null,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Stack(children: [
              Tiles(gameData: gameData),
              HomeButton(),
              if (widget.gameId.length == 6) GameCode(gameCode: widget.gameId),
              SettingsButton(
                gameId: widget.gameId,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
