import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tally/models/team.dart';
import 'package:tally/services/database.dart';
import 'package:provider/provider.dart';
import 'package:tally/screens/scoreboard/game_info.dart';
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
    gameData.updateScores(3, 10);

    return StreamProvider<List<Team>?>.value(
      value: DatabaseService(gameId: widget.gameId).game,
      initialData: null,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Stack(children: [
              Column(
                children: [
                  GameInfo(),
                  Text(widget.gameId),
                  Expanded(
                    child: GestureDetector(
                      onPanUpdate: (details) {
                        swipeDirection = details.delta.dy < 0 ? 'up' : 'down';
                      },
                      onPanEnd: (details) {
                        if (swipeDirection == null) {
                          return;
                        }
                        if (swipeDirection == 'up') {
                          setState(() {});
                        }
                        if (swipeDirection == 'down') {
                          setState(() {});
                        }
                      },
                      child: InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: Ink(
                            child: Center(
                              child: Text(
                                '$team1Score',
                                style: TextStyle(
                                  fontSize: 50,
                                ),
                              ),
                            ),
                            color: Colors.green),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onPanUpdate: (details) {
                        swipeDirection = details.delta.dy < 0 ? 'up' : 'down';
                      },
                      onPanEnd: (details) {
                        if (swipeDirection == null) {
                          return;
                        }
                        if (swipeDirection == 'up') {
                          setState(() {});
                        }
                        if (swipeDirection == 'down') {
                          setState(() {});
                        }
                      },
                      child: InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: Ink(
                            child: Center(
                              child: Text(
                                '$team2Score',
                                style: TextStyle(
                                  fontSize: 50,
                                ),
                              ),
                            ),
                            color: Colors.amber),
                      ),
                    ),
                  ),
                ],
              ),
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
                // child: ElevatedButton.icon(
                //   icon: Icon(Icons.home),
                //   label: Text('Home'),
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/scoreboard_settings');
                //   },
                // ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/scoreboard_settings');
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Icon(
                    Icons.settings,
                    size: 30,
                  ),
                  padding: EdgeInsets.all(10),
                  shape: CircleBorder(),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
