import 'package:flutter/material.dart';
import 'package:tally/models/game_arguments.dart';
import 'package:tally/services/database.dart';
import 'package:tally/services/game_id.dart';

class CreateGameButton extends StatefulWidget {
  const CreateGameButton({Key? key}) : super(key: key);

  @override
  State<CreateGameButton> createState() => _CreateGameButtonState();
}

class _CreateGameButtonState extends State<CreateGameButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
            onTap: () {
              String gameId = generateShortId();
              DatabaseService(gameId: gameId).createGame();
              Navigator.pushNamed(context, "/scoreboard",
                  arguments: GameArguments(gameId));
            },
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.lightBlueAccent,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Create",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Game",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
