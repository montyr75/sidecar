// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'saved_builds.dart';

class SavedBuildsMapper extends MapperBase<SavedBuilds> {
  static MapperContainer container = MapperContainer(
    mappers: {SavedBuildsMapper()},
  )..linkAll({VehicleMapper.container});

  @override
  SavedBuildsMapperElement createElement(MapperContainer container) {
    return SavedBuildsMapperElement._(this, container);
  }

  @override
  String get id => 'SavedBuilds';

  static final fromMap = container.fromMap<SavedBuilds>;
  static final fromJson = container.fromJson<SavedBuilds>;
}

class SavedBuildsMapperElement extends MapperElementBase<SavedBuilds> {
  SavedBuildsMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  SavedBuilds decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  SavedBuilds fromMap(Map<String, dynamic> map) =>
      SavedBuilds(container.$getOpt(map, 'vehicles') ?? const []);

  @override
  Function get encoder => encode;
  dynamic encode(SavedBuilds v) => toMap(v);
  Map<String, dynamic> toMap(SavedBuilds s) =>
      {'vehicles': container.$enc(s.vehicles, 'vehicles')};

  @override
  String stringify(SavedBuilds self) =>
      'SavedBuilds(vehicles: ${container.asString(self.vehicles)})';
  @override
  int hash(SavedBuilds self) => container.hash(self.vehicles);
  @override
  bool equals(SavedBuilds self, SavedBuilds other) =>
      container.isEqual(self.vehicles, other.vehicles);
}

mixin SavedBuildsMappable {
  String toJson() => SavedBuildsMapper.container.toJson(this as SavedBuilds);
  Map<String, dynamic> toMap() =>
      SavedBuildsMapper.container.toMap(this as SavedBuilds);
  SavedBuildsCopyWith<SavedBuilds, SavedBuilds, SavedBuilds> get copyWith =>
      _SavedBuildsCopyWithImpl(this as SavedBuilds, $identity, $identity);
  @override
  String toString() => SavedBuildsMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          SavedBuildsMapper.container.isEqual(this, other));
  @override
  int get hashCode => SavedBuildsMapper.container.hash(this);
}

extension SavedBuildsValueCopy<$R, $Out extends SavedBuilds>
    on ObjectCopyWith<$R, SavedBuilds, $Out> {
  SavedBuildsCopyWith<$R, SavedBuilds, $Out> get asSavedBuilds =>
      base.as((v, t, t2) => _SavedBuildsCopyWithImpl(v, t, t2));
}

typedef SavedBuildsCopyWithBound = SavedBuilds;

abstract class SavedBuildsCopyWith<$R, $In extends SavedBuilds,
    $Out extends SavedBuilds> implements ObjectCopyWith<$R, $In, $Out> {
  SavedBuildsCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends SavedBuilds>(
      Then<SavedBuilds, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, Vehicle, VehicleCopyWith<$R, Vehicle, Vehicle>> get vehicles;
  $R call({List<Vehicle>? vehicles});
}

class _SavedBuildsCopyWithImpl<$R, $Out extends SavedBuilds>
    extends CopyWithBase<$R, SavedBuilds, $Out>
    implements SavedBuildsCopyWith<$R, SavedBuilds, $Out> {
  _SavedBuildsCopyWithImpl(super.value, super.then, super.then2);
  @override
  SavedBuildsCopyWith<$R2, SavedBuilds, $Out2>
      chain<$R2, $Out2 extends SavedBuilds>(
              Then<SavedBuilds, $Out2> t, Then<$Out2, $R2> t2) =>
          _SavedBuildsCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, Vehicle, VehicleCopyWith<$R, Vehicle, Vehicle>>
      get vehicles => ListCopyWith(
          $value.vehicles,
          (v, t) => v.copyWith.chain<$R, Vehicle>($identity, t),
          (v) => call(vehicles: v));
  @override
  $R call({List<Vehicle>? vehicles}) =>
      $then(SavedBuilds(vehicles ?? $value.vehicles));
}
