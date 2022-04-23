import 'package:flutter/material.dart';
import 'package:tally/globals.dart' as globals;
// ignore_for_file: prefer_const_constructors

class ScoreboardSettings extends StatefulWidget {
  const ScoreboardSettings({Key? key}) : super(key: key);

  @override
  _ScoreboardSettingsState createState() => _ScoreboardSettingsState();
}

class _ScoreboardSettingsState extends State<ScoreboardSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Scoreboard Settings"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        print(globals.team1Score);
                        globals.team1Score = 0;
                        globals.team2Score = 0;
                        print(globals.team1Score);
                      });
                    },
                    label: Text('Reset'),
                    icon: Icon(Icons.restart_alt_rounded)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
