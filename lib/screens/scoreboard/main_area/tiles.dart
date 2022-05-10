import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:tally/models/team.dart';
import 'package:tally/screens/scoreboard/main_area/score_tile.dart';
import 'package:tally/services/database.dart';

class Tiles extends StatefulWidget {
  final DatabaseService gameData;

  const Tiles({Key? key, required this.gameData}) : super(key: key);

  @override
  State<Tiles> createState() => _TilesState();
}

class _TilesState extends State<Tiles> {
  @override
  Widget build(BuildContext context) {
    final teams = Provider.of<List<Team>?>(context);
    if (teams == null) {
      return Container();
    }

    return Column(
      children: [
        Expanded(
          child: ScoreTile(team: teams[0], gameData: widget.gameData),
        ),
        Expanded(
          child: ScoreTile(team: teams[1], gameData: widget.gameData),
        ),
      ],
    );
  }
}
