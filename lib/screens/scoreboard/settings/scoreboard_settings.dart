import 'package:flutter/material.dart';

import 'reset_all_button.dart';
// ignore_for_file: prefer_const_constructors

class ScoreboardSettings extends StatefulWidget {
  const ScoreboardSettings({Key? key}) : super(key: key);

  @override
  _ScoreboardSettingsState createState() => _ScoreboardSettingsState();
}

class _ScoreboardSettingsState extends State<ScoreboardSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Settings"),
        actions: const [
          ResetAllButton(),
        ],
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Center(
          child: Stack(
            children: const [
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
