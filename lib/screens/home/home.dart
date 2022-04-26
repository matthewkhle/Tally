import 'package:flutter/material.dart';
import 'package:tally/screens/home/quick_game_button.dart';
import 'package:tally/services/clear_database.dart';

import 'create_game_button.dart';
import 'join_game.dart';
// ignore_for_file: prefer_const_constructors

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    clearDatabase();
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              QuickGameButton(),
              Divider(
                color: Colors.white,
                thickness: 3,
                indent: 10,
                endIndent: 10,
              ),
              IntrinsicHeight(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CreateGameButton(),
                      VerticalDivider(
                        thickness: 3,
                        width: 20,
                        color: Colors.white,
                      ),
                      JoinGame(),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
