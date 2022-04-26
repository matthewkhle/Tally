import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:tally/models/team.dart';
import 'package:tally/screens/scoreboard/score_tile.dart';

class Tiles extends StatefulWidget {
  const Tiles({Key? key}) : super(key: key);

  @override
  State<Tiles> createState() => _TilesState();
}

class _TilesState extends State<Tiles> {
  @override
  Widget build(BuildContext context) {
    final teams = Provider.of<List<Team>>(context);
    return Column(
      children: [
        ListView.builder(
            itemCount: teams.length,
            itemBuilder: (BuildContext context, int index) {
              return ScoreTile(team: teams[index]);
            }),
      ],
    );
  }
}
