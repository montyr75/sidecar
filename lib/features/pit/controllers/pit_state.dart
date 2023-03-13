import '../../../db/models/saved_vehicle_state.dart';

class PitState {
  final bool isLoading;
  final List<SavedVehicleState> savedStates;

  const PitState({
    this.isLoading = false,
    this.savedStates = const [],
  });

  PitState copyWith({
    bool? isLoading,
    List<SavedVehicleState>? savedStates,
  }) {
    return PitState(
      isLoading: isLoading ?? this.isLoading,
      savedStates: savedStates ?? this.savedStates,
    );
  }
}
