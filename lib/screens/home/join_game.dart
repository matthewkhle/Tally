import 'dart:ui';

import 'package:flutter/material.dart';

class JoinGame extends StatefulWidget {
  const JoinGame({Key? key}) : super(key: key);

  @override
  State<JoinGame> createState() => _JoinGameState();
}

class _JoinGameState extends State<JoinGame> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 150.0,
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelText: 'Enter Code',
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 3,
                  color: Colors.lightBlueAccent,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 3,
                  color: Colors.lightBlueAccent,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              // fillColor: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
            ),
            onPressed: () {},
            child: const Text(
              'Join',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
