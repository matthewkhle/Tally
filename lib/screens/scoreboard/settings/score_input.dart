import 'package:flutter/material.dart';
import 'package:tally/models/team.dart';

class ScoreInput extends StatefulWidget {
  final Team team;
  final Function onChange;

  const ScoreInput({Key? key, required this.team, required this.onChange})
      : super(key: key);

  @override
  State<ScoreInput> createState() => _ScoreInputState();
}

class _ScoreInputState extends State<ScoreInput> {
  final TextEditingController _scoreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _scoreController.text = "${widget.team.score}";

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _scoreController,
          onChanged: (newScore) {
            widget.onChange(
              widget.team.id,
              int.parse(newScore),
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
    );
  }
}
