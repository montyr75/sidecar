import 'package:quiver/core.dart' show Optional;

import '../../features/chop_shop/controllers/shop/shop_state.dart';
import '../../features/record_sheet/controller/vehicle_state.dart';

class AppState {
  final VehicleState? initialCarState;
  final ShopState? initialCarBuilderState;

  const AppState({
    this.initialCarState,
    this.initialCarBuilderState,
  });

  AppState copyWith({
    VehicleState? initialCarState,
    Optional<ShopState?>? initialCarBuilderState,
  }) {
    return AppState(
      initialCarState: initialCarState ?? this.initialCarState,
      initialCarBuilderState: initialCarBuilderState != null ? initialCarBuilderState.orNull : this.initialCarBuilderState,
    );
  }
}