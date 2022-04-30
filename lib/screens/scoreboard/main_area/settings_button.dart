import "package:flutter/material.dart";
import 'package:tally/models/game_arguments.dart';

class SettingsButton extends StatefulWidget {
  final String gameId;

  const SettingsButton({Key? key, required this.gameId}) : super(key: key);

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            "/scoreboard_settings",
            arguments: GameArguments(widget.gameId),
          );
        },
        color: Colors.lightBlueAccent,
        textColor: Colors.white,
        child: const Icon(
          Icons.settings,
          size: 30,
        ),
        padding: const EdgeInsets.all(10),
        shape: const CircleBorder(),
      ),
    );
  }
}
