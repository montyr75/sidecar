import 'package:quiver/core.dart' show Optional;

import '../../features/car_record_sheet/controller/car_state.dart';
import '../../features/chop_shop/controllers/shop/shop_state.dart';

class AppState {
  final CarState? initialCarState;
  final ShopState? initialCarBuilderState;

  const AppState({
    this.initialCarState,
    this.initialCarBuilderState,
  });

  AppState copyWith({
    CarState? initialCarState,
    Optional<ShopState?>? initialCarBuilderState,
  }) {
    return AppState(
      initialCarState: initialCarState ?? this.initialCarState,
      initialCarBuilderState: initialCarBuilderState != null ? initialCarBuilderState.orNull : this.initialCarBuilderState,
    );
  }
}