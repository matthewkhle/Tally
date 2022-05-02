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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _scoreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = widget.team.name;
    _scoreController.text = "${widget.team.score}";

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nameController,
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _scoreController,
              onChanged: (text) {
                widget.onChange(
                  widget.team.id,
                  int.parse(text),
                  widget.team.name,
                  widget.team.color,
                );
              },
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Score',
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
          ),
        ],
      ),
    );
  }
}
