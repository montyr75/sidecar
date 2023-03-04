import 'enums.dart';

class CwDie {
  final Die type;
  final List<CwDieResult> results;

  const CwDie({
    required this.type,
    required this.results,
  });
}

enum CwDieResult {
  shield,
  doubleShield,
  star,
  doubleStar,
  wrench,
  doubleWrench,
}