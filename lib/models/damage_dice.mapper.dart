// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'damage_dice.dart';

class DiceMapper extends ClassMapperBase<Dice> {
  DiceMapper._();
  static DiceMapper? _instance;
  static DiceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DiceMapper._());
      DieMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Dice';

  static Die _$die(Dice v) => v.die;
  static int _$qty(Dice v) => v.qty;

  @override
  final Map<Symbol, Field<Dice, dynamic>> fields = const {
    #die: Field<Dice, Die>('die', _$die),
    #qty: Field<Dice, int>('qty', _$qty),
  };

  static Dice _instantiate(DecodingData data) {
    return Dice(data.get(#die), data.get(#qty));
  }

  @override
  final Function instantiate = _instantiate;

  static Dice fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Dice>(map));
  }

  static Dice fromJson(String json) {
    return _guard((c) => c.fromJson<Dice>(json));
  }
}

mixin DiceMappable {
  String toJson() {
    return DiceMapper._guard((c) => c.toJson(this as Dice));
  }

  Map<String, dynamic> toMap() {
    return DiceMapper._guard((c) => c.toMap(this as Dice));
  }

  DiceCopyWith<Dice, Dice, Dice> get copyWith =>
      _DiceCopyWithImpl(this as Dice, $identity, $identity);
  @override
  String toString() {
    return DiceMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DiceMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return DiceMapper._guard((c) => c.hash(this));
  }
}

extension DiceValueCopy<$R, $Out extends Dice>
    on ObjectCopyWith<$R, Dice, $Out> {
  DiceCopyWith<$R, Dice, $Out> get $asDice =>
      $base.as((v, t, t2) => _DiceCopyWithImpl(v, t, t2));
}

typedef DiceCopyWithBound = Dice;

abstract class DiceCopyWith<$R, $In extends Dice, $Out extends Dice>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({Die? die, int? qty});
  DiceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Dice>(
      Then<Dice, $Out2> t, Then<$Out2, $R2> t2);
}

class _DiceCopyWithImpl<$R, $Out extends Dice>
    extends ClassCopyWithBase<$R, Dice, $Out>
    implements DiceCopyWith<$R, Dice, $Out> {
  _DiceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Dice> $mapper = DiceMapper.ensureInitialized();
  @override
  $R call({Die? die, int? qty}) => $apply(FieldCopyWithData(
      {if (die != null) #die: die, if (qty != null) #qty: qty}));
  @override
  Dice $make(CopyWithData data) =>
      Dice(data.get(#die, or: $value.die), data.get(#qty, or: $value.qty));

  @override
  DiceCopyWith<$R2, Dice, $Out2> $chain<$R2, $Out2 extends Dice>(
          Then<Dice, $Out2> t, Then<$Out2, $R2> t2) =>
      _DiceCopyWithImpl($value, t, t2);
}

class DamageDiceMapper extends ClassMapperBase<DamageDice> {
  DamageDiceMapper._();
  static DamageDiceMapper? _instance;
  static DamageDiceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DamageDiceMapper._());
      DiceMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'DamageDice';

  static int _$basicDamage(DamageDice v) => v.basicDamage;
  static int _$tiresDamage(DamageDice v) => v.tiresDamage;
  static List<Dice> _$dice(DamageDice v) => v.dice;

  @override
  final Map<Symbol, Field<DamageDice, dynamic>> fields = const {
    #basicDamage:
        Field<DamageDice, int>('basicDamage', _$basicDamage, opt: true, def: 0),
    #tiresDamage:
        Field<DamageDice, int>('tiresDamage', _$tiresDamage, opt: true, def: 0),
    #dice:
        Field<DamageDice, List<Dice>>('dice', _$dice, opt: true, def: const []),
  };

  static DamageDice _instantiate(DecodingData data) {
    return DamageDice(
        basicDamage: data.get(#basicDamage),
        tiresDamage: data.get(#tiresDamage),
        dice: data.get(#dice));
  }

  @override
  final Function instantiate = _instantiate;

  static DamageDice fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<DamageDice>(map));
  }

  static DamageDice fromJson(String json) {
    return _guard((c) => c.fromJson<DamageDice>(json));
  }
}

mixin DamageDiceMappable {
  String toJson() {
    return DamageDiceMapper._guard((c) => c.toJson(this as DamageDice));
  }

  Map<String, dynamic> toMap() {
    return DamageDiceMapper._guard((c) => c.toMap(this as DamageDice));
  }

  DamageDiceCopyWith<DamageDice, DamageDice, DamageDice> get copyWith =>
      _DamageDiceCopyWithImpl(this as DamageDice, $identity, $identity);
  @override
  String toString() {
    return DamageDiceMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DamageDiceMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return DamageDiceMapper._guard((c) => c.hash(this));
  }
}

extension DamageDiceValueCopy<$R, $Out extends DamageDice>
    on ObjectCopyWith<$R, DamageDice, $Out> {
  DamageDiceCopyWith<$R, DamageDice, $Out> get $asDamageDice =>
      $base.as((v, t, t2) => _DamageDiceCopyWithImpl(v, t, t2));
}

typedef DamageDiceCopyWithBound = DamageDice;

abstract class DamageDiceCopyWith<$R, $In extends DamageDice,
    $Out extends DamageDice> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Dice, DiceCopyWith<$R, Dice, Dice>> get dice;
  $R call({int? basicDamage, int? tiresDamage, List<Dice>? dice});
  DamageDiceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends DamageDice>(
      Then<DamageDice, $Out2> t, Then<$Out2, $R2> t2);
}

class _DamageDiceCopyWithImpl<$R, $Out extends DamageDice>
    extends ClassCopyWithBase<$R, DamageDice, $Out>
    implements DamageDiceCopyWith<$R, DamageDice, $Out> {
  _DamageDiceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DamageDice> $mapper =
      DamageDiceMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Dice, DiceCopyWith<$R, Dice, Dice>> get dice => ListCopyWith(
      $value.dice,
      (v, t) => v.copyWith.$chain<$R, Dice>($identity, t),
      (v) => call(dice: v));
  @override
  $R call({int? basicDamage, int? tiresDamage, List<Dice>? dice}) =>
      $apply(FieldCopyWithData({
        if (basicDamage != null) #basicDamage: basicDamage,
        if (tiresDamage != null) #tiresDamage: tiresDamage,
        if (dice != null) #dice: dice
      }));
  @override
  DamageDice $make(CopyWithData data) => DamageDice(
      basicDamage: data.get(#basicDamage, or: $value.basicDamage),
      tiresDamage: data.get(#tiresDamage, or: $value.tiresDamage),
      dice: data.get(#dice, or: $value.dice));

  @override
  DamageDiceCopyWith<$R2, DamageDice, $Out2>
      $chain<$R2, $Out2 extends DamageDice>(
              Then<DamageDice, $Out2> t, Then<$Out2, $R2> t2) =>
          _DamageDiceCopyWithImpl($value, t, t2);
}
