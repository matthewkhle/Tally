import 'dart:math';

String generateLongId() {
  var rng = Random();
  var code = rng.nextInt(900000000) + 100000000;
  return code.toString();
}

String generateShortId() {
  var rng = Random();
  var code = rng.nextInt(9000) + 1000;
  return code.toString();
}
