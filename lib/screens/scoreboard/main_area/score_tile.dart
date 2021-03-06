import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tally/models/color_map.dart';
import 'package:tally/models/team.dart';
import 'package:tally/services/database.dart';

class ScoreTile extends StatefulWidget {
  final Team team;
  final DatabaseService gameData;

  const ScoreTile({Key? key, required this.team, required this.gameData})
      : super(key: key);

  @override
  State<ScoreTile> createState() => _ScoreTileState();
}

class _ScoreTileState extends State<ScoreTile> {
  String? swipeDirection;

  modifyScore(Team team, int amount) {
    widget.gameData.update(Team(
      id: team.id,
      score: team.score += amount,
      color: team.color,
      name: team.name,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        swipeDirection = details.delta.dy < 0 ? 'up' : 'down';
      },
      onPanEnd: (details) {
        if (swipeDirection == null) {
          return;
        }
        if (swipeDirection == 'up') {
          setState(() {
            modifyScore(widget.team, 1);
          });
        }
        if (swipeDirection == 'down') {
          setState(() {
            modifyScore(widget.team, -1);
          });
        }
      },
      child: InkWell(
        onTap: () {
          setState(() {
            modifyScore(widget.team, 1);
          });
        },
        child: Ink(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.team.name.toString(),
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    widget.team.score.toString(),
                    style: const TextStyle(
                      fontSize: 175,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            color: getMaterialColor(widget.team.color)),
      ),
    );
  }
}
