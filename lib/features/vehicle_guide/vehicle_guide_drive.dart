import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../routes.dart';
import '../../services/app/app_service.dart';
import '../auth/services/auth_service.dart';
import '../record_sheet/controller/vehicle_state.dart';
import 'vehicle_guide_selector_page.dart';

class VehicleGuideDrive extends ConsumerWidget {
  const VehicleGuideDrive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VehicleGuideSelectorPage(
      onSelected: (vehicle) {
        ref.read(appServiceProvider.notifier).drive(VehicleState.fromVehicle(ref.read(authServiceProvider).uid, vehicle));
        context.goNamed(AppRoute.carRecordSheet.name);
      },
    );
  }
}
