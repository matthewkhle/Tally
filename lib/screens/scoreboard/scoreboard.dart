import 'package:flutter/material.dart';
import 'package:tally/globals.dart' as globals;
// ignore_for_file: prefer_const_constructors

class Scoreboard extends StatefulWidget {
  final String gameId;
  const Scoreboard({Key? key, required this.gameId}) : super(key: key);


  @override
  _ScoreboardState createState() => _ScoreboardState();
}


class _ScoreboardState extends State<Scoreboard> {
  String? swipeDirection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
              children: [
            Column(
              children: [
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
                        setState(() {
                          globals.team1Score++;
                        });
                      }
                      if (swipeDirection == 'down') {
                        setState(() {
                          globals.team1Score--;
                        });
                      }
                    },
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          globals.team1Score++;
                        });
                      },
                      child: Ink(
                          child: Center(
                            child: Text(
                              globals.team1Score.toString(),
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
                        setState(() {
                          globals.team2Score++;
                        });
                      }
                      if (swipeDirection == 'down') {
                        setState(() {
                          globals.team2Score--;
                        });
                      }
                    },
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          globals.team2Score++;
                        });
                      },
                      child: Ink(
                          child: Center(
                            child: Text(
                              globals.team2Score.toString(),
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
    );
  }
}
