import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tally/models/team.dart';

class DatabaseService {
  late String gameId;

  // collection reference
  late CollectionReference gameCollection;

  DatabaseService({required this.gameId}) {
    gameCollection = FirebaseFirestore.instance.collection('Game: ' + gameId);
  }

  createGame(Team team1, Team team2) {
    update(team1);
    update(team2);
  }

  update(Team team) async {
    await gameCollection.doc(team.id).set({
      'id': team.id,
      'score': team.score,
      'color': team.color,
      'name': team.name,
    });
  }

  // team list from snapshot
  List<Team> _teamListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Team(
        id: doc.get('id'),
        score: doc.get('score') ?? 0,
        color: doc.get('color') ?? Colors.red,
        name: doc.get('name') ?? "",
      );
    }).toList();
  }

  // get games stream
  Stream<List<Team>> get game {
    return gameCollection.snapshots().map(_teamListFromSnapshot);
  }
}
