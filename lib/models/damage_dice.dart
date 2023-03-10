import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils/utils.dart';
import 'enums.dart';

part 'damage_dice.g.dart';

@JsonSerializable()
class Dice implements Comparable<Dice> {
  final Die die;
  final int qty;

  const Dice(this.die, this.qty);

  /// expecting format "Die.black:2"
  factory Dice.fromString(String value) {
    final splitValue = value.split(':');

    return Dice(
      Die.fromString(splitValue.first),
      int.tryParse(splitValue.last) ?? 0,
    );
  }

  @override
  int compareTo(Dice other) => die.index.compareTo(other.die.index);

  factory Dice.fromJson(Map<String, dynamic> json) => _$DiceFromJson(json);
  Map<String, dynamic> toJson() => _$DiceToJson(this);
}

@JsonSerializable()
class DamageDice {
  final int basicDamage;
  final int tiresDamage;
  final List<Dice> dice;

  const DamageDice({
    this.basicDamage = 0,
    this.tiresDamage = 0,
    this.dice = const [],
  });

  DamageDice addDice(Die die, int value) {
    if (value.min(0) == 0) {
      return this;
    }

    final existingDie = dice.firstWhereOrNull((value) => value.die == die);

    if (existingDie != null) {
      return copyWith(dice: List.unmodifiable(dice.toList()..replaceWith(existingDie, Dice(die, existingDie.qty + value))..sort()));
    }

    return copyWith(dice: List.unmodifiable((dice.toList()..add(Dice(die, value))..sort())));
  }

  DamageDice removeDice(Die die, int value) {
    final existingDie = dice.firstWhereOrNull((value) => value.die == die);

    if (existingDie != null) {
      final newQty = (existingDie.qty - value).min(0);

      if (newQty == 0) {
        return this;
      }

      return copyWith(dice: List.unmodifiable(dice.toList()..replaceWith(existingDie, Dice(die, newQty))));
    }

    return this;
  }

  bool get hasBasicDamage => basicDamage > 0;
  bool get hasTiresDamage => tiresDamage > 0;
  bool get hasDice => dice.isNotEmpty;

  DamageDice copyWith({
    int? basicDamage,
    int? tiresDamage,
    List<Dice>? dice,
  }) {
    return DamageDice(
      basicDamage: basicDamage ?? this.basicDamage,
      tiresDamage: tiresDamage ?? this.tiresDamage,
      dice: dice ?? this.dice,
    );
  }

  factory DamageDice.fromJson(Map<String, dynamic> json) => _$DamageDiceFromJson(json);
  Map<String, dynamic> toJson() => _$DamageDiceToJson(this);
}

@JsonSerializable()
class CrewDamageDice {
  final DamageDice? driverDamage;
  final DamageDice? gunnerDamage;

  const CrewDamageDice({
    this.driverDamage,
    this.gunnerDamage,
  });

  factory CrewDamageDice.fromJson(Map<String, dynamic> json) => _$CrewDamageDiceFromJson(json);
  Map<String, dynamic> toJson() => _$CrewDamageDiceToJson(this);
}