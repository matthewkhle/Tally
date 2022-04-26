import 'package:flutter/material.dart';
import 'package:tally/models/team.dart';

class ScoreTile extends StatefulWidget {
  final Team team;

  const ScoreTile({Key? key, required this.team}) : super(key: key);

  @override
  State<ScoreTile> createState() => _ScoreTileState();
}

class _ScoreTileState extends State<ScoreTile> {
  String? swipeDirection;

  @override
  Widget build(BuildContext context) {
    // return Container(child: Text(widget.team.score.toString()));
    return Expanded(
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
                  '$widget.team.score',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              color: Colors.green),
        ),
      ),
    );
  }
}
