import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:tally/models/team.dart';

class Scorekeeping extends StatefulWidget {
  const Scorekeeping({Key? key}) : super(key: key);

  @override
  State<Scorekeeping> createState() => _ScorekeepingState();
}

class _ScorekeepingState extends State<Scorekeeping> {
  @override
  Widget build(BuildContext context) {
    final game = Provider.of<List<Team>>(context);
    return Container();
  }
}
