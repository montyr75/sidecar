import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/car_record_sheet/controller/car_state.dart';
import '../../features/chop_shop/controllers/car_builder/car_builder_state.dart';
import 'app_state.dart';

part 'app_service.g.dart';

@Riverpod(keepAlive: true)
class AppService extends _$AppService {
  @override
  AppState build() => const AppState();

  void driveCar(CarState initialState) => state = state.copyWith(initialCarState: initialState);
  void buildCar(CarBuilderState initialState) => state = state.copyWith(initialCarBuilderState: initialState);
}