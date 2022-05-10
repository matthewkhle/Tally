import 'package:flutter/material.dart';
import 'package:tally/models/team.dart';
import 'package:tally/screens/scoreboard/settings/color_picker.dart';
import 'package:tally/screens/scoreboard/settings/score_input.dart';

import 'name_input.dart';

class TeamSettings extends StatefulWidget {
  final Team team;
  final Function updateName;
  final Function updateScore;
  final Function updateColor;

  const TeamSettings(
      {Key? key,
      required this.team,
      required this.updateName,
      required this.updateScore,
      required this.updateColor})
      : super(key: key);

  @override
  State<TeamSettings> createState() => _TeamSettingsState();
}

class _TeamSettingsState extends State<TeamSettings> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.team.id,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          NameInput(team: widget.team, onChange: widget.updateName),
          Row(
            children: [
              ScoreInput(team: widget.team, onChange: widget.updateScore),
              ColorPicker(team: widget.team, onChange: widget.updateColor),
            ],
          ),
        ],
      ),
    );
  }
}
