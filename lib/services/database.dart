import 'package:cloud_firestore/cloud_firestore.dart';

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
}