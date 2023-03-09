import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../routes.dart';
import '../../services/app/app_service.dart';
import '../../widgets/vehicle_browser.dart';
import '../chop_shop/controllers/shop/shop_state.dart';
import 'vehicle_guide_selector_page.dart';

class VehicleGuideBuild extends ConsumerWidget {
  const VehicleGuideBuild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VehicleGuideSelectorPage(
      selectionType: VehicleSelectionType.build,
      onSelected: (vehicle) {
        ref.read(appServiceProvider.notifier).buildVehicle(ShopState.fromVehicle(vehicle));
        context.pushNamed(AppRoute.shop.name);
      },
    );
  }
}
