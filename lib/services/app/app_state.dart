import '../../features/car_record_sheet/controller/car_state.dart';
import '../../features/chop_shop/controllers/car_builder/car_builder_state.dart';

class AppState {
  final CarState? initialCarState;
  final CarBuilderState? initialCarBuilderState;

  const AppState({
    this.initialCarState,
    this.initialCarBuilderState,
  });

  AppState copyWith({
    CarState? initialCarState,
    CarBuilderState? initialCarBuilderState,
  }) {
    return AppState(
      initialCarState: initialCarState ?? this.initialCarState,
      initialCarBuilderState: initialCarBuilderState ?? this.initialCarBuilderState,
    );
  }
}