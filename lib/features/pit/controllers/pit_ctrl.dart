import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../db/models/saved_vehicle_state.dart';
import '../../../utils/utils.dart';
import '../../auth/services/auth_service.dart';
import '../../chop_shop/repos/vehicle_repo.dart';
import '../../record_sheet/controller/vehicle_state.dart';
import 'pit_state.dart';

part 'pit_ctrl.g.dart';

@riverpod
class PitCtrl extends _$PitCtrl {
  @override
  PitState build() {
    _init();
    return const PitState(isLoading: true);
  }

  Future<void> _init() async {
    final savedStates = await ref.read(vehicleRepoProvider).getSavedVehicleStates();
    state = state.copyWith(isLoading: false, savedStates: savedStates);
  }

  Future<bool> saveState(String name, VehicleState vehicleState) async {
    final authState = ref.read(authServiceProvider);

    state = state.copyWith(isLoading: true);

    final savedVehicleState = SavedVehicleState(
      id: uuid.v4(),
      uid: authState.uid,
      username: authState.username,
      name: name,
      timestamp: DateTime.now().millisecondsSinceEpoch,
      state: vehicleState,
    );

    final success = await ref.read(vehicleRepoProvider).saveVehicleState(savedVehicleState);

    state = state.copyWith(
      isLoading: false,
      savedStates: List<SavedVehicleState>.unmodifiable(
        state.savedStates.toList()..add(savedVehicleState),
      ),
    );

    return success;
  }

  Future<bool> deleteState(String id) {
    state = state.copyWith(isLoading: true);

    final success = ref.read(vehicleRepoProvider).deleteVehicleState(id);

    state = state.copyWith(
      isLoading: false,
      savedStates: List<SavedVehicleState>.unmodifiable(
        state.savedStates.toList()..removeWhere((value) => value.id == id),
      ),
    );

    return success;
  }
}
