import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tally/models/team.dart';

class DatabaseService {
  late String gameId;

  // collection reference
  late CollectionReference gameCollection;

  DatabaseService({required this.gameId}) {
    gameCollection = FirebaseFirestore.instance.collection('Game: ' + gameId);
  }

  updateScores(int team1Score, int team2Score) async {
    await gameCollection.doc('Team 1').set({
      'score': team1Score,
    });
    await gameCollection.doc('Team 2').set({
      'score': team2Score,
    });
  }

  // team list from snapshot
  List<Team> _teamListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Team(score: doc.get('score') ?? 0);
    }).toList();
  }

  // get games stream
  Stream<List<Team>> get game {
    return gameCollection.snapshots().map(_teamListFromSnapshot);
  }
}
