import 'package:flutter/material.dart';
import 'package:tally/models/colorMap.dart';
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
              child: Text(
                widget.team.score.toString(),
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
            color: ColorMap.toMaterialColor(widget.team.color)),
      ),
    );
  }
}
