import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tally/models/team.dart';
import 'package:tally/screens/scoreboard/settings_button.dart';
import 'package:tally/screens/scoreboard/tiles.dart';
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
    final DatabaseService gameData = DatabaseService(gameId: "1234");
    Team team1 = Team(id: "Team 1", score: 0, color: "green", name: "Mambacitas");
    Team team2 = Team(id: "Team 2", score: 0, color: "amber", name: "Broncos");
    gameData.createGame(team1, team2);

    return StreamProvider<List<Team>?>.value(
      value: DatabaseService(gameId: widget.gameId).game,
      initialData: null,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Stack(children: [
              Tiles(),

              Align(
                alignment: Alignment.centerLeft,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Icon(
                    Icons.home,
                    size: 30,
                  ),
                  padding: EdgeInsets.all(10),
                  shape: CircleBorder(),
                ),
              ),
              SettingsButton(),
            ]),
          ),
        ),
      ),
    );
  }
}
