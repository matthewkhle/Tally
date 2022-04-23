import 'package:flutter/material.dart';
import 'package:tally/models/gameArguments.dart';

import 'package:tally/services/database.dart';
// ignore_for_file: prefer_const_constructors

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/scoreboard",
                        arguments: GameArguments('1234'));
                  },
                  child: Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20.0),
                      color: Colors.green,
                    ),
                    child: Center(
                      child: Text(
                        "QUICK GAME",
                      ),
                    ),
                  )),
              Divider(
                color: Colors.black,
                thickness: 3,
                indent: 10,
                endIndent: 10,
              ),
              Text('Shared Game'),
              IntrinsicHeight(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                              onTap: () {},
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.green,
                                ),
                                child: Center(
                                  child: Text(
                                    "Create",
                                  ),
                                ),
                              ))),
                      VerticalDivider(
                        thickness: 2,
                        width: 20,
                        color: Colors.black,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150.0,
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                labelText: 'Enter Code',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.green),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.green),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green),
                              ),
                              onPressed: () {},
                              child: Text('Join'),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
