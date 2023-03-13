// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_ctrl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shopCtrlHash() => r'69499583e37f686af2b7c9dcb4a41cb589dbe20b';

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

abstract class _$ShopCtrl extends BuildlessAutoDisposeNotifier<ShopState> {
  late final ShopState? initialValue;

  ShopState build([
    ShopState? initialValue,
  ]);
}

/// See also [ShopCtrl].
@ProviderFor(ShopCtrl)
const shopCtrlProvider = ShopCtrlFamily();

/// See also [ShopCtrl].
class ShopCtrlFamily extends Family<ShopState> {
  /// See also [ShopCtrl].
  const ShopCtrlFamily();

  /// See also [ShopCtrl].
  ShopCtrlProvider call([
    ShopState? initialValue,
  ]) {
    return ShopCtrlProvider(
      initialValue,
    );
  }

  @override
  ShopCtrlProvider getProviderOverride(
    covariant ShopCtrlProvider provider,
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
  String? get name => r'shopCtrlProvider';
}

/// See also [ShopCtrl].
class ShopCtrlProvider
    extends AutoDisposeNotifierProviderImpl<ShopCtrl, ShopState> {
  /// See also [ShopCtrl].
  ShopCtrlProvider([
    this.initialValue,
  ]) : super.internal(
          () => ShopCtrl()..initialValue = initialValue,
          from: shopCtrlProvider,
          name: r'shopCtrlProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shopCtrlHash,
          dependencies: ShopCtrlFamily._dependencies,
          allTransitiveDependencies: ShopCtrlFamily._allTransitiveDependencies,
        );

  final ShopState? initialValue;

  @override
  bool operator ==(Object other) {
    return other is ShopCtrlProvider && other.initialValue == initialValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initialValue.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  ShopState runNotifierBuild(
    covariant ShopCtrl notifier,
  ) {
    return notifier.build(
      initialValue,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
