import 'package:tally/services/database.dart';

class Game {
  late String gameId;

  Game() {
    gameId = generateGameId();
  }

  String generateGameId() {
    return '123456';
  }

  Future createGame() async {
    await DatabaseService(gameId: gameId).updateData(0, 1);
    return gameId;
  }
}