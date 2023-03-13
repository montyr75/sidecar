import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../routes.dart';
import '../../../services/app/app_service.dart';
import '../../../utils/popup_utils.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/vehicle_browser.dart';
import 'controllers/pit_ctrl.dart';

class PitPage extends ConsumerWidget {
  const PitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pitCtrlProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "The Pit",
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'Blazed',
            color: Colors.blueGrey,
          ),
        ),
      ),
      body: !state.isLoading
          ? SingleChildScrollView(
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
                          ...state.savedStates.map((value) {
                            return Card(
                              child: ListTile(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      value.name,
                                      style: const TextStyle(fontSize: 18, fontFamily: 'Audiowide'),
                                    ),
                                    Text(
                                      DateFormat.yMd().add_jm().format(DateTime.fromMillisecondsSinceEpoch(value.timestamp)),
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: sm),
                                  child: Text.rich(
                                    TextSpan(
                                      text: "",
                                      children: [
                                        const TextSpan(
                                          text: "Vehicle: ",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(text: value.state.vehicle.name.toString()),
                                        const TextSpan(
                                          text: "   Chassis: ",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(text: value.state.vehicle.chassis.toString()),
                                        const TextSpan(
                                          text: "   Division: ",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(text: value.state.vehicle.division.toString()),
                                      ],
                                    ),
                                  ),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        ref.read(appServiceProvider.notifier).drive(value.state);
                                        context.goNamed(AppRoute.recordSheet.name);
                                      },
                                      child: Text(
                                        VehicleSelectionType.drive.toString(),
                                        style: const TextStyle(fontFamily: 'Facon'),
                                      ),
                                    ),
                                    boxM,
                                    IconButton(
                                      onPressed: () => _deleteState(context, ref, value.id),
                                      icon: Icon(Icons.delete, color: Theme.of(context).primaryColor,),
                                      tooltip: "Dump it",
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                          // VehicleBrowser(
                          //     key: ObjectKey(state.savedStates),
                          //     vehicleStates: vehicleStates,
                          //     selectionTypes: const [
                          //       VehicleSelectionType.drive,
                          //       VehicleSelectionType.delete,
                          //     ],
                          //     onSelected: (result) {
                          //       if (result.type == VehicleSelectionType.drive) {
                          //         ref.read(appServiceProvider.notifier).drive(result.state);
                          //         context.goNamed(AppRoute.recordSheet.name);
                          //       }
                          //       else if (result.type == VehicleSelectionType.delete) {
                          //         _deleteState(context, ref, result.state.id);
                          //       }
                          //     }),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Future<void> _deleteState(BuildContext context, WidgetRef ref, String id) async {
    final confirm = await showConfirmDialog(
      context: context,
      message: "Are you sure you want to retire this vehicle forever?",
    );

    if (confirm) {
      ref.read(pitCtrlProvider.notifier).deleteState(id);
    }
  }
}
