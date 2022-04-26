import 'package:flutter/material.dart';
import 'package:tally/models/game_arguments.dart';
import 'package:tally/services/game_id.dart';

class QuickGameButton extends StatefulWidget {
  const QuickGameButton({Key? key}) : super(key: key);

  @override
  State<QuickGameButton> createState() => _QuickGameButtonState();
}

class _QuickGameButtonState extends State<QuickGameButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/scoreboard",
            arguments: GameArguments(generateLongId()));
      },
      child: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.lightBlueAccent,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Quick",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "Game",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
