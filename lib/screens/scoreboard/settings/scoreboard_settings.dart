import 'package:flutter/material.dart';
import 'package:tally/models/team.dart';
import 'package:tally/screens/loading.dart';
import 'package:tally/screens/scoreboard/settings/team_settings.dart';

import '../../../services/database.dart';
import 'reset_all_button.dart';
// ignore_for_file: prefer_const_constructors

class ScoreboardSettings extends StatefulWidget {
  final String gameId;

  const ScoreboardSettings({Key? key, required this.gameId}) : super(key: key);

  @override
  _ScoreboardSettingsState createState() => _ScoreboardSettingsState();
}

class _ScoreboardSettingsState extends State<ScoreboardSettings> {
  late Team team1;
  late Team team2;

  void updateName(String id, String name) {
    if (id == "Team 1") {
      team1 = Team(id: id, score: team1.score, name: name, color: team1.color);
    } else if (id == "Team 2") {
      team2 = Team(id: id, score: team2.score, name: name, color: team2.color);
    }
  }

  void updateScore(String id, int score) {
    if (id == "Team 1") {
      team1 = Team(id: id, score: score, name: team1.name, color: team1.color);
    } else if (id == "Team 2") {
      team2 = Team(id: id, score: score, name: team2.name, color: team2.color);
    }
  }

  void updateColor(String id, String color) {
    if (id == "Team 1") {
      team1 = Team(id: id, score: team1.score, name: team1.name, color: color);
    } else if (id == "Team 2") {
      team2 = Team(id: id, score: team2.score, name: team2.name, color: color);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Team>>(
      future: DatabaseService(gameId: widget.gameId).teams,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Team>? teams = snapshot.data;
          team1 = teams![0];
          team2 = teams[1];
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightBlueAccent[200],
              title: Text("Settings"),
              actions: [
                ResetAllButton(gameId: widget.gameId),
              ],
              centerTitle: true,
            ),
            backgroundColor: Colors.grey[900],
            body: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          DatabaseService(gameId: widget.gameId).update(team1);
                          DatabaseService(gameId: widget.gameId).update(team2);
                          Navigator.pop(context);
                        },
                        child: Text("Save"),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        TeamSettings(
                          team: teams[0],
                          updateName: (String id, String name) {
                            updateName(id, name);
                          },
                          updateScore: (String id, int score) {
                            updateScore(id, score);
                          },
                          updateColor: (String id, String color) {
                            updateColor(id, color);
                          },
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 3,
                          indent: 10,
                          endIndent: 10,
                        ),
                        TeamSettings(
                          team: teams[1],
                          updateName: (String id, String name) {
                            updateName(id, name);
                          },
                          updateScore: (String id, int score) {
                            updateScore(id, score);
                          },
                          updateColor: (String id, String color) {
                            updateColor(id, color);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Loading();
      },
    );
  }
}
