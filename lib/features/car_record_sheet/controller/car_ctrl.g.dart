// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_ctrl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$carCtrlHash() => r'ed7c01d7c761929d2f842d10b70ecdc92dc2f431';

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

abstract class _$CarCtrl extends BuildlessAutoDisposeNotifier<CarState> {
  late final CarState value;

  CarState build(
    CarState value,
  );
}

/// See also [CarCtrl].
@ProviderFor(CarCtrl)
const carCtrlProvider = CarCtrlFamily();

/// See also [CarCtrl].
class CarCtrlFamily extends Family<CarState> {
  /// See also [CarCtrl].
  const CarCtrlFamily();

  /// See also [CarCtrl].
  CarCtrlProvider call(
    CarState value,
  ) {
    return CarCtrlProvider(
      value,
    );
  }

  @override
  CarCtrlProvider getProviderOverride(
    covariant CarCtrlProvider provider,
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
  String? get name => r'carCtrlProvider';
}

/// See also [CarCtrl].
class CarCtrlProvider
    extends AutoDisposeNotifierProviderImpl<CarCtrl, CarState> {
  /// See also [CarCtrl].
  CarCtrlProvider(
    this.value,
  ) : super.internal(
          () => CarCtrl()..value = value,
          from: carCtrlProvider,
          name: r'carCtrlProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$carCtrlHash,
          dependencies: CarCtrlFamily._dependencies,
          allTransitiveDependencies: CarCtrlFamily._allTransitiveDependencies,
        );

  final CarState value;

  @override
  bool operator ==(Object other) {
    return other is CarCtrlProvider && other.value == value;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, value.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  CarState runNotifierBuild(
    covariant CarCtrl notifier,
  ) {
    return notifier.build(
      value,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
