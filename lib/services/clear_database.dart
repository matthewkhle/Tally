import 'package:cloud_firestore/cloud_firestore.dart';

clearDatabase() {
  CollectionReference gameCollection =
      FirebaseFirestore.instance.collection('Game: 1169');
  gameCollection.snapshots().forEach((element) {
    for (QueryDocumentSnapshot snapshot in element.docs) {
      snapshot.reference.delete();
    }
  });
}
