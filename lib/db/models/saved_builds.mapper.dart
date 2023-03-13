// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'saved_builds.dart';

class SavedBuildsMapper extends ClassMapperBase<SavedBuilds> {
  SavedBuildsMapper._();
  static SavedBuildsMapper? _instance;
  static SavedBuildsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SavedBuildsMapper._());
      VehicleMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'SavedBuilds';

  static List<Vehicle> _$vehicles(SavedBuilds v) => v.vehicles;

  @override
  final Map<Symbol, Field<SavedBuilds, dynamic>> fields = const {
    #vehicles: Field<SavedBuilds, List<Vehicle>>('vehicles', _$vehicles,
        opt: true, def: const []),
  };

  static SavedBuilds _instantiate(DecodingData data) {
    return SavedBuilds(data.get(#vehicles));
  }

  @override
  final Function instantiate = _instantiate;

  static SavedBuilds fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<SavedBuilds>(map));
  }

  static SavedBuilds fromJson(String json) {
    return _guard((c) => c.fromJson<SavedBuilds>(json));
  }
}

mixin SavedBuildsMappable {
  String toJson() {
    return SavedBuildsMapper._guard((c) => c.toJson(this as SavedBuilds));
  }

  Map<String, dynamic> toMap() {
    return SavedBuildsMapper._guard((c) => c.toMap(this as SavedBuilds));
  }

  SavedBuildsCopyWith<SavedBuilds, SavedBuilds, SavedBuilds> get copyWith =>
      _SavedBuildsCopyWithImpl(this as SavedBuilds, $identity, $identity);
  @override
  String toString() {
    return SavedBuildsMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SavedBuildsMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return SavedBuildsMapper._guard((c) => c.hash(this));
  }
}

extension SavedBuildsValueCopy<$R, $Out extends SavedBuilds>
    on ObjectCopyWith<$R, SavedBuilds, $Out> {
  SavedBuildsCopyWith<$R, SavedBuilds, $Out> get $asSavedBuilds =>
      $base.as((v, t, t2) => _SavedBuildsCopyWithImpl(v, t, t2));
}

typedef SavedBuildsCopyWithBound = SavedBuilds;

abstract class SavedBuildsCopyWith<$R, $In extends SavedBuilds,
    $Out extends SavedBuilds> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Vehicle, VehicleCopyWith<$R, Vehicle, Vehicle>> get vehicles;
  $R call({List<Vehicle>? vehicles});
  SavedBuildsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends SavedBuilds>(
      Then<SavedBuilds, $Out2> t, Then<$Out2, $R2> t2);
}

class _SavedBuildsCopyWithImpl<$R, $Out extends SavedBuilds>
    extends ClassCopyWithBase<$R, SavedBuilds, $Out>
    implements SavedBuildsCopyWith<$R, SavedBuilds, $Out> {
  _SavedBuildsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SavedBuilds> $mapper =
      SavedBuildsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Vehicle, VehicleCopyWith<$R, Vehicle, Vehicle>>
      get vehicles => ListCopyWith(
          $value.vehicles,
          (v, t) => v.copyWith.$chain<$R, Vehicle>($identity, t),
          (v) => call(vehicles: v));
  @override
  $R call({List<Vehicle>? vehicles}) =>
      $apply(FieldCopyWithData({if (vehicles != null) #vehicles: vehicles}));
  @override
  SavedBuilds $make(CopyWithData data) =>
      SavedBuilds(data.get(#vehicles, or: $value.vehicles));

  @override
  SavedBuildsCopyWith<$R2, SavedBuilds, $Out2>
      $chain<$R2, $Out2 extends SavedBuilds>(
              Then<SavedBuilds, $Out2> t, Then<$Out2, $R2> t2) =>
          _SavedBuildsCopyWithImpl($value, t, t2);
}
