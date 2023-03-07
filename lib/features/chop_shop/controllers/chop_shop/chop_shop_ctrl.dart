import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../db/models/saved_builds.dart';
import '../../../../models/vehicle.dart';
import '../../repos/vehicle_repo.dart';
import 'chop_shop_state.dart';

part 'chop_shop_ctrl.g.dart';

@riverpod
class ChopShopCtrl extends _$ChopShopCtrl {
  @override
  ChopShopState build() {
    _init();
    return const ChopShopState(isLoading: true);
  }

  Future<void> _init() async {
    final savedBuilds = await ref.read(vehicleRepoProvider).getSavedBuilds();

    if (savedBuilds != null) {
      state = state.copyWith(isLoading: false, savedBuilds: savedBuilds);
    }
    else {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<bool> saveBuild(Vehicle vehicle) async {
    final vehicles = state.savedBuilds.vehicles.toList()..add(vehicle);

    state = state.copyWith(
      savedBuilds: SavedBuilds(List<Vehicle>.unmodifiable(vehicles..sort())),
    );

    state = state.copyWith(isLoading: true);

    final success = await _persistSavedBuilds();

    state = state.copyWith(isLoading: false);

    return success;
  }

  Future<bool> _persistSavedBuilds() async {
    return ref.read(vehicleRepoProvider).saveSavedBuilds(state.savedBuilds);
  }
}