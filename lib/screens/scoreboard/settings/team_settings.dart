import 'package:flutter/material.dart';
import 'package:tally/models/team.dart';

class TeamSettings extends StatefulWidget {
  final Team team;
  final Function onChange;

  const TeamSettings({Key? key, required this.team, required this.onChange})
      : super(key: key);

  @override
  State<TeamSettings> createState() => _TeamSettingsState();
}

class _TeamSettingsState extends State<TeamSettings> {
  final TextEditingController _teamNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _teamNameController.text = widget.team.name;

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${widget.team.id}",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          TextField(
            controller: _teamNameController,
            onChanged: (text) {
              widget.onChange(
                widget.team.id,
                widget.team.score,
                text,
                widget.team.color,
              );
            },
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              labelText: 'Team Name',
              labelStyle: const TextStyle(
                color: Colors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 3,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 3,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              // fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
