// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'saved_vehicle_state.dart';

class SavedVehicleStateMapper extends ClassMapperBase<SavedVehicleState> {
  SavedVehicleStateMapper._();
  static SavedVehicleStateMapper? _instance;
  static SavedVehicleStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SavedVehicleStateMapper._());
      VehicleStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'SavedVehicleState';

  static String _$uid(SavedVehicleState v) => v.uid;
  static String _$username(SavedVehicleState v) => v.username;
  static VehicleState _$state(SavedVehicleState v) => v.state;

  @override
  final Map<Symbol, Field<SavedVehicleState, dynamic>> fields = const {
    #uid: Field<SavedVehicleState, String>('uid', _$uid),
    #username: Field<SavedVehicleState, String>('username', _$username),
    #state: Field<SavedVehicleState, VehicleState>('state', _$state),
  };

  static SavedVehicleState _instantiate(DecodingData data) {
    return SavedVehicleState(
        uid: data.get(#uid),
        username: data.get(#username),
        state: data.get(#state));
  }

  @override
  final Function instantiate = _instantiate;

  static SavedVehicleState fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<SavedVehicleState>(map));
  }

  static SavedVehicleState fromJson(String json) {
    return _guard((c) => c.fromJson<SavedVehicleState>(json));
  }
}

mixin SavedVehicleStateMappable {
  String toJson() {
    return SavedVehicleStateMapper._guard(
        (c) => c.toJson(this as SavedVehicleState));
  }

  Map<String, dynamic> toMap() {
    return SavedVehicleStateMapper._guard(
        (c) => c.toMap(this as SavedVehicleState));
  }

  SavedVehicleStateCopyWith<SavedVehicleState, SavedVehicleState,
          SavedVehicleState>
      get copyWith => _SavedVehicleStateCopyWithImpl(
          this as SavedVehicleState, $identity, $identity);
  @override
  String toString() {
    return SavedVehicleStateMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SavedVehicleStateMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return SavedVehicleStateMapper._guard((c) => c.hash(this));
  }
}

extension SavedVehicleStateValueCopy<$R, $Out extends SavedVehicleState>
    on ObjectCopyWith<$R, SavedVehicleState, $Out> {
  SavedVehicleStateCopyWith<$R, SavedVehicleState, $Out>
      get $asSavedVehicleState =>
          $base.as((v, t, t2) => _SavedVehicleStateCopyWithImpl(v, t, t2));
}

typedef SavedVehicleStateCopyWithBound = SavedVehicleState;

abstract class SavedVehicleStateCopyWith<$R, $In extends SavedVehicleState,
    $Out extends SavedVehicleState> implements ClassCopyWith<$R, $In, $Out> {
  VehicleStateCopyWith<$R, VehicleState, VehicleState> get state;
  $R call({String? uid, String? username, VehicleState? state});
  SavedVehicleStateCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends SavedVehicleState>(
          Then<SavedVehicleState, $Out2> t, Then<$Out2, $R2> t2);
}

class _SavedVehicleStateCopyWithImpl<$R, $Out extends SavedVehicleState>
    extends ClassCopyWithBase<$R, SavedVehicleState, $Out>
    implements SavedVehicleStateCopyWith<$R, SavedVehicleState, $Out> {
  _SavedVehicleStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SavedVehicleState> $mapper =
      SavedVehicleStateMapper.ensureInitialized();
  @override
  VehicleStateCopyWith<$R, VehicleState, VehicleState> get state =>
      $value.state.copyWith.$chain($identity, (v) => call(state: v));
  @override
  $R call({String? uid, String? username, VehicleState? state}) =>
      $apply(FieldCopyWithData({
        if (uid != null) #uid: uid,
        if (username != null) #username: username,
        if (state != null) #state: state
      }));
  @override
  SavedVehicleState $make(CopyWithData data) => SavedVehicleState(
      uid: data.get(#uid, or: $value.uid),
      username: data.get(#username, or: $value.username),
      state: data.get(#state, or: $value.state));

  @override
  SavedVehicleStateCopyWith<$R2, SavedVehicleState, $Out2>
      $chain<$R2, $Out2 extends SavedVehicleState>(
              Then<SavedVehicleState, $Out2> t, Then<$Out2, $R2> t2) =>
          _SavedVehicleStateCopyWithImpl($value, t, t2);
}
