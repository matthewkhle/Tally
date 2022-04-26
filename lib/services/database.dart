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
    initializeTeam(team1);
    initializeTeam(team2);
  }

  initializeTeam(Team team) {
    initializeId(team.id);
    updateScore(team.id, team.score);
    updateColor(team.id, team.color);
    updateName(team.id, team.name);
  }

  initializeId(String teamId) async {
    await gameCollection.doc(teamId).set({
      'id': teamId,
    });
  }

  updateScore(String teamId, int score) async {
    await gameCollection.doc(teamId).set({
      'score': score,
    });
  }

  updateColor(String teamId, String color) async {
    await gameCollection.doc(teamId).set({
      'color': color,
    });
  }

  updateName(String teamId, String name) async {
    await gameCollection.doc(teamId).set({
      'name': name,
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
