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

  void updateTeam(String id, int score, String name, String color) {
    Team newTeam = Team(id: id, score: score, name: name, color: color);

    if (id == "Team 1") {
      team1 = newTeam;
    } else {
      team2 = newTeam;
    }
    print(team1.name);
    print(team2.name);
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
                          onChange: (String id, int score, String name,
                              String color) {
                            updateTeam(id, score, name, color);
                          },
                        ),
                        TeamSettings(
                            team: teams[1],
                            onChange: (String id, int score, String name,
                                String color) {
                              updateTeam(id, score, name, color);
                            }),
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
