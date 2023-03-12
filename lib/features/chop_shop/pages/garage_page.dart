import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';
import '../../../services/app/app_service.dart';
import '../../../utils/popup_utils.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/vehicle_browser.dart';
import '../../car_record_sheet/controller/car_state.dart';
import '../controllers/chop_shop/chop_shop_ctrl.dart';
import '../controllers/shop/shop_state.dart';

class GaragePage extends ConsumerWidget {
  const GaragePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedBuilds = ref.watch(chopShopCtrlProvider.select((value) => value.savedBuilds));
    final carStates = savedBuilds.vehicles.map((value) => CarState.fromVehicle(value)).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "The Garage",
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'Blazed',
            color: Colors.blueGrey,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: paddingAllM,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    VehicleBrowser(
                      key: ObjectKey(savedBuilds),
                      carStates: carStates,
                      selectionTypes: const [
                        VehicleSelectionType.drive,
                        VehicleSelectionType.build,
                        VehicleSelectionType.delete,
                      ],
                      onSelected: (result) {
                        switch (result.type) {
                          case VehicleSelectionType.drive:
                            ref.read(appServiceProvider.notifier).drive(CarState.fromVehicle(result.vehicle));
                            context.goNamed(AppRoute.carRecordSheet.name);
                            break;
                          case VehicleSelectionType.build:
                            ref.read(appServiceProvider.notifier).buildVehicle(ShopState.fromVehicle(result.vehicle));
                            context.pushNamed(AppRoute.shop.name);
                            break;
                          case VehicleSelectionType.delete:
                            _deleteBuild(context, ref, result.vehicle.id);
                            break;
                        }
                      },
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _deleteBuild(BuildContext context, WidgetRef ref, String vehicleID) async {
    final confirm = await showConfirmDialog(
      context: context,
      message: "Are you sure you want to dump this vehicle forever?",
    );

    if (confirm) {
      ref.read(chopShopCtrlProvider.notifier).deleteBuild(vehicleID);
    }
  }
}
