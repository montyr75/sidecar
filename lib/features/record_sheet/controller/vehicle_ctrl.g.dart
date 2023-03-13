// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_ctrl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vehicleCtrlHash() => r'f4f2cc8f258dc8d4c1e3a8fc7e86532ba34fbe9e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$VehicleCtrl
    extends BuildlessAutoDisposeNotifier<VehicleState> {
  late final VehicleState value;

  VehicleState build(
    VehicleState value,
  );
}

/// See also [VehicleCtrl].
@ProviderFor(VehicleCtrl)
const vehicleCtrlProvider = VehicleCtrlFamily();

/// See also [VehicleCtrl].
class VehicleCtrlFamily extends Family<VehicleState> {
  /// See also [VehicleCtrl].
  const VehicleCtrlFamily();

  /// See also [VehicleCtrl].
  VehicleCtrlProvider call(
    VehicleState value,
  ) {
    return VehicleCtrlProvider(
      value,
    );
  }

  @override
  VehicleCtrlProvider getProviderOverride(
    covariant VehicleCtrlProvider provider,
  ) {
    return call(
      provider.value,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'vehicleCtrlProvider';
}

/// See also [VehicleCtrl].
class VehicleCtrlProvider
    extends AutoDisposeNotifierProviderImpl<VehicleCtrl, VehicleState> {
  /// See also [VehicleCtrl].
  VehicleCtrlProvider(
    this.value,
  ) : super.internal(
          () => VehicleCtrl()..value = value,
          from: vehicleCtrlProvider,
          name: r'vehicleCtrlProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vehicleCtrlHash,
          dependencies: VehicleCtrlFamily._dependencies,
          allTransitiveDependencies:
              VehicleCtrlFamily._allTransitiveDependencies,
        );

  final VehicleState value;

  @override
  bool operator ==(Object other) {
    return other is VehicleCtrlProvider && other.value == value;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, value.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  VehicleState runNotifierBuild(
    covariant VehicleCtrl notifier,
  ) {
    return notifier.build(
      value,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
