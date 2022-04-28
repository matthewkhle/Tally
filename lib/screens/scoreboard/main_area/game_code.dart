import 'package:flutter/material.dart';

class GameCode extends StatefulWidget {
  final String gameCode;

  const GameCode({Key? key, required this.gameCode}) : super(key: key);

  @override
  State<GameCode> createState() => _GameCodeState();
}

class _GameCodeState extends State<GameCode> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Text(
          'Code: ${widget.gameCode}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            // backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
