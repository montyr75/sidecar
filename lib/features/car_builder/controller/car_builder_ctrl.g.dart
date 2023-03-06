// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_builder_ctrl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$carBuilderCtrlHash() => r'6c0438b263d0efa968306dc67e97a5b504d67681';

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

abstract class _$CarBuilderCtrl
    extends BuildlessAutoDisposeNotifier<CarBuilderState> {
  late final CarBuilderState? initialValue;

  CarBuilderState build([
    CarBuilderState? initialValue,
  ]);
}

/// See also [CarBuilderCtrl].
@ProviderFor(CarBuilderCtrl)
const carBuilderCtrlProvider = CarBuilderCtrlFamily();

/// See also [CarBuilderCtrl].
class CarBuilderCtrlFamily extends Family<CarBuilderState> {
  /// See also [CarBuilderCtrl].
  const CarBuilderCtrlFamily();

  /// See also [CarBuilderCtrl].
  CarBuilderCtrlProvider call([
    CarBuilderState? initialValue,
  ]) {
    return CarBuilderCtrlProvider(
      initialValue,
    );
  }

  @override
  CarBuilderCtrlProvider getProviderOverride(
    covariant CarBuilderCtrlProvider provider,
  ) {
    return call(
      provider.initialValue,
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
  String? get name => r'carBuilderCtrlProvider';
}

/// See also [CarBuilderCtrl].
class CarBuilderCtrlProvider
    extends AutoDisposeNotifierProviderImpl<CarBuilderCtrl, CarBuilderState> {
  /// See also [CarBuilderCtrl].
  CarBuilderCtrlProvider([
    this.initialValue,
  ]) : super.internal(
          () => CarBuilderCtrl()..initialValue = initialValue,
          from: carBuilderCtrlProvider,
          name: r'carBuilderCtrlProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$carBuilderCtrlHash,
          dependencies: CarBuilderCtrlFamily._dependencies,
          allTransitiveDependencies:
              CarBuilderCtrlFamily._allTransitiveDependencies,
        );

  final CarBuilderState? initialValue;

  @override
  bool operator ==(Object other) {
    return other is CarBuilderCtrlProvider &&
        other.initialValue == initialValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initialValue.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  CarBuilderState runNotifierBuild(
    covariant CarBuilderCtrl notifier,
  ) {
    return notifier.build(
      initialValue,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
