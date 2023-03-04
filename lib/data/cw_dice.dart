import '../models/cw_die.dart';
import '../models/enums.dart';

const Map<Die, CwDie> cwDice = {
  Die.red: CwDie(
    type: Die.red,
    results: [
      CwDieResult.shield,
      CwDieResult.shield,
      CwDieResult.shield,
      CwDieResult.wrench,
      CwDieResult.star,
      CwDieResult.star,
    ],
  ),
  Die.yellow: CwDie(
    type: Die.yellow,
    results: [
      CwDieResult.shield,
      CwDieResult.shield,
      CwDieResult.star,
      CwDieResult.star,
      CwDieResult.star,
      CwDieResult.doubleStar,
    ],
  ),
  Die.green: CwDie(
    type: Die.green,
    results: [
      CwDieResult.shield,
      CwDieResult.wrench,
      CwDieResult.wrench,
      CwDieResult.star,
      CwDieResult.doubleStar,
      CwDieResult.doubleStar,
    ],
  ),
  Die.blue: CwDie(
    type: Die.blue,
    results: [
      CwDieResult.shield,
      CwDieResult.shield,
      CwDieResult.shield,
      CwDieResult.star,
      CwDieResult.star,
      CwDieResult.star,
    ],
  ),
  Die.white: CwDie(
    type: Die.white,
    results: [
      CwDieResult.doubleShield,
      CwDieResult.shield,
      CwDieResult.doubleWrench,
      CwDieResult.wrench,
      CwDieResult.star,
      CwDieResult.doubleStar,
    ],
  ),
  Die.black: CwDie(
    type: Die.black,
    results: [
      CwDieResult.shield,
      CwDieResult.wrench,
      CwDieResult.wrench,
      CwDieResult.wrench,
      CwDieResult.wrench,
      CwDieResult.star,
    ],
  ),
};
