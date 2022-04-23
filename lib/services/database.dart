import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String gameId;
  DatabaseService({ required this.gameId });

  // collection reference
  final CollectionReference scoreCollection = FirebaseFirestore.instance.collection('scores');

  Future updateData(int score1, int score2) async {
    return await scoreCollection.doc(gameId).set({
      'score1': score1,
      'score2': score2,
    });
  }
}