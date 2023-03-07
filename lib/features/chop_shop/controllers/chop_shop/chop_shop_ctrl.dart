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
    return const ChopShopState();
  }

  Future<void> _init() async {
    final savedBuilds = await ref.read(vehicleRepoProvider).getSavedBuilds();

    if (savedBuilds != null) {
      state = state.copyWith(savedBuilds: savedBuilds);
    }
  }

  void saveBuild(Vehicle vehicle) {
    final vehicles = state.savedBuilds.vehicles.toList()..add(vehicle);

    state = state.copyWith(
      savedBuilds: SavedBuilds(List<Vehicle>.unmodifiable(vehicles..sort())),
    );

    _persistSavedBuilds();
  }

  void _persistSavedBuilds() {
    ref.read(vehicleRepoProvider).saveSavedBuilds(state.savedBuilds);
  }
}