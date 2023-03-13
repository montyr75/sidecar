import 'package:quiver/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/chop_shop/controllers/shop/shop_state.dart';
import '../../features/record_sheet/controller/vehicle_state.dart';
import 'app_state.dart';

part 'app_service.g.dart';

@Riverpod(keepAlive: true)
class AppService extends _$AppService {
  @override
  AppState build() => const AppState();

  void drive(VehicleState initialState) => state = state.copyWith(initialCarState: initialState);
  void buildVehicle(ShopState initialState) => state = state.copyWith(initialCarBuilderState: Optional<ShopState?>.of(initialState));
  void buildNewVehicle() => state = state.copyWith(initialCarBuilderState: const Optional<ShopState?>.absent());
}