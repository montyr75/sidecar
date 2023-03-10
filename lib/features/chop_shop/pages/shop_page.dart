import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../data/components.dart' as db;
import '../../../models/components.dart';
import '../../../models/enums.dart';
import '../../../models/form_models.dart';
import '../../../routes.dart';
import '../../../services/app/app_service.dart';
import '../../../utils/popup_utils.dart';
import '../../../utils/screen_utils.dart';
import '../../../utils/utils.dart';
import '../../../widgets/component_display.dart';
import '../../../widgets/panel_list.dart';
import '../../auth/services/auth_service.dart';
import '../../record_sheet/controller/vehicle_state.dart';
import '../controllers/chop_shop/chop_shop_ctrl.dart';
import '../controllers/shop/shop_ctrl.dart';
import '../controllers/shop/shop_state.dart';
import '../widgets/component_selector.dart';

final divisions = List<int>.generate(12, (i) => i + 1);

class ShopPage extends ConsumerWidget {
  static const labelStyle = TextStyle(fontFamily: 'Facon', color: Colors.blueGrey);

  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.watch(authServiceProvider.select((value) => value.uid));
    final initialState = ref.watch(appServiceProvider.select((value) => value.initialCarBuilderState));

    final ctrl = ref.read(shopCtrlProvider(initialState).notifier);
    final state = ref.watch(shopCtrlProvider(initialState));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: state.canSave ? () => _saveBuild(context, ref, state) : null,
            child: const Text(
              "Save",
              style: TextStyle(fontFamily: 'Facon'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: med),
            child: TextButton(
              onPressed: state.isValid
                  ? () {
                      ref.read(appServiceProvider.notifier).drive((state.toState(uid)));
                      context.goNamed(AppRoute.recordSheet.name);
                    }
                  : null,
              child: const Text(
                "Drive",
                style: TextStyle(fontFamily: 'Facon'),
              ),
            ),
          ),
        ],
        title: const Text(
          "The Shop",
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 350,
                      child: _NameInput(
                        field: state.name,
                        onChanged: (value) => ctrl.nameChanged(value),
                      ),
                    ),
                    boxXXL,
                    _PointBar(state: state),
                    boxXXL,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 225,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Chassis", style: labelStyle),
                              boxS,
                              DropdownButtonFormField<Chassis>(
                                value: state.chassis,
                                onChanged: (value) => ctrl.onChassisChanged(value!),
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: radiusM,
                                    // borderSide: BorderSide.none,
                                  ),
                                  filled: false,
                                ),
                                items: Chassis.values.map<DropdownMenuItem<Chassis>>((value) {
                                  return DropdownMenuItem<Chassis>(
                                    value: value,
                                    child: SizedBox(
                                      width: 175,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(value.toString()),
                                          Text(
                                            value.source.toAbbrString(),
                                            style: const TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        boxXL,
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Division", style: labelStyle),
                            boxS,
                            SizedBox(
                              width: 80,
                              child: DropdownButtonFormField<int>(
                                value: state.division,
                                onChanged: (value) => ctrl.onDivisionChanged(value!),
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: radiusM,
                                    // borderSide: BorderSide.none,
                                  ),
                                  filled: false,
                                ),
                                items: divisions.map<DropdownMenuItem<int>>((value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    boxXXL,
                    LocationComps(
                      loc: Location.crew,
                      division: state.division,
                      components: state.components.allCrewComponents,
                      onSelected: (value) => addComponent(context, ctrl, Location.crew, value),
                      onRemoved: (value) => ctrl.removeComponent(value),
                    ),
                    for (final loc in Location.carLocs) ...[
                      boxXXL,
                      LocationComps(
                        loc: loc,
                        division: state.division,
                        components: state.components.getCarCompsByLoc(loc),
                        onSelected: (value) => addComponent(context, ctrl, loc, value),
                        onRemoved: (value) => ctrl.removeComponent(value),
                      ),
                    ],
                    boxXXL,
                    LocationComps(
                      loc: Location.turret,
                      division: state.division,
                      components: state.components.getCompsByLoc(Location.turret),
                      onSelected: (value) => addComponent(context, ctrl, Location.turret, value),
                      onRemoved: (value) => ctrl.removeComponent(value),
                    ),
                    boxXXL,
                    LocationComps(
                      loc: Location.upgrade,
                      division: state.division,
                      components: state.components.getCompsByLoc(Location.upgrade),
                      onSelected: (value) => addComponent(context, ctrl, Location.upgrade, value),
                      onRemoved: (value) => ctrl.removeComponent(value),
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

  Future<bool> addComponent(BuildContext context, ShopCtrl ctrl, Location loc, ComponentState comp) async {
    final result = ctrl.addComponentPrecheck(loc, comp);

    if (result.hasConflict) {
      final confirm = await showConfirmDialog(
        context: context,
        message: result.toReasonString(),
      );

      if (!confirm) {
        return false;
      }
    }

    ctrl.addComponent(loc: loc, component: comp, existingComp: result.existingComp);
    return true;
  }

  Future<void> _saveBuild(BuildContext context, WidgetRef ref, ShopState state) async {
    final chopShopState = ref.read(chopShopCtrlProvider);

    if (chopShopState.savedBuilds.exists(state.name.value.trim(), state.division)) {
      final confirm = await showConfirmDialog(
        context: context,
        message: "This vehicle name/division combination already exists. Are you sure you want to overwrite it?",
      );

      if (!confirm) {
        return;
      }
    }

    final success = await ref.read(chopShopCtrlProvider.notifier).saveBuild(state.toVehicle());

    if (success) {
      showSuccessToast("${state.name.value.trim()} saved.");
    }
  }
}

class _PointBar extends StatelessWidget {
  final ShopState state;

  const _PointBar({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _PointDisplay(
          label: "AP",
          value: state.ap,
        ),
        _PointDisplay(
          label: "BP",
          value: state.bpSpent,
          maxValue: state.bp,
        ),
        _PointDisplay(
          label: "CP",
          value: state.cpSpent,
          maxValue: state.cp,
        ),
      ].joinWidgetList(boxXXL).toList(),
    );
  }
}

class _PointDisplay extends StatelessWidget {
  final String label;
  final int value;
  final int? maxValue;

  const _PointDisplay({Key? key, required this.label, this.value = 0, this.maxValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final overSpent = maxValue != null && value > maxValue!;

    return Container(
      width: 95,
      height: 75,
      decoration: BoxDecoration(
        border: Border.all(color: !overSpent ? Colors.grey : Colors.red),
        borderRadius: radiusM,
      ),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0, -0.3),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultTextStyle(
                    style: const TextStyle(fontSize: 18, fontFamily: 'Audiowide', color: Colors.white),
                    child: Text.rich(
                      TextSpan(
                        text: value.toString(),
                        children: maxValue != null
                            ? [
                                const TextSpan(text: ' / ', style: TextStyle(color: Colors.blueGrey)),
                                TextSpan(text: maxValue.toString(), style: const TextStyle(color: Colors.blueGrey)),
                              ]
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: paddingAllM,
                child: Text(label, style: ShopPage.labelStyle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LocationComps extends ConsumerWidget {
  final Location loc;
  final int division;
  final List<ComponentState> components;
  final CompSelectorCallback onSelected;
  final ValueChanged<ComponentState> onRemoved;

  const LocationComps({
    Key? key,
    required this.loc,
    required this.division,
    required this.components,
    required this.onSelected,
    required this.onRemoved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${loc.toString()}${loc == Location.upgrade ? 's' : ''}",
              style: ShopPage.labelStyle,
            ),
            _buildAddMenu(context),
          ],
        ),
        if (components.isNotEmpty) PanelList(key: ObjectKey(loc), items: _generateComponentItems(components)),
      ],
    );
  }

  Widget _buildAddMenu(BuildContext context) {
    if (loc == Location.crew) {
      return PopupMenuButton<String>(
        tooltip: "Add crew",
        shape: RoundedRectangleBorder(borderRadius: radiusM),
        offset: const Offset(0, 30),
        onSelected: (item) {
          List<Component> selectables;

          switch (item) {
            case "Driver":
              selectables = db.components.values.drivers;
              break;
            case "Gunner":
              selectables = db.components.values.gunners;
              break;
            case "Sidearm":
              selectables = db.components.values.sidearms;
              break;
            case "Gear":
              selectables = db.components.values.gear;
              break;
            default:
              selectables = const [];
          }

          _showComponentSelector(
            context: context,
            loc: loc,
            components: selectables,
            onSelected: onSelected,
          );
        },
        itemBuilder: (BuildContext context) => [
          const PopupMenuItem<String>(
            value: "Driver",
            child: Text('Driver'),
          ),
          const PopupMenuItem<String>(
            value: "Gunner",
            child: Text('Gunner'),
          ),
          const PopupMenuItem<String>(
            value: "Sidearm",
            child: Text('Sidearm'),
          ),
          const PopupMenuItem<String>(
            value: "Gear",
            child: Text('Gear'),
          ),
        ],
        child: const Icon(Icons.add),
      );
    } else if (loc == Location.turret) {
      return PopupMenuButton<String>(
        tooltip: "Add turreted weapon",
        shape: RoundedRectangleBorder(borderRadius: radiusM),
        offset: const Offset(0, 30),
        onSelected: (item) {
          List<Component> selectables = db.components.values.getCompByAttr(Attribute.turret);

          _showComponentSelector(
            context: context,
            loc: loc,
            components: selectables,
            onSelected: onSelected,
          );
        },
        itemBuilder: (BuildContext context) => [
          const PopupMenuItem(value: "Turreted Weapon", child: Text("Turreted Weapon")),
        ],
        child: const Icon(Icons.add),
      );
    } else if (loc == Location.upgrade) {
      return PopupMenuButton<String>(
        tooltip: "Add upgrade",
        shape: RoundedRectangleBorder(borderRadius: radiusM),
        offset: const Offset(0, 30),
        onSelected: (item) {
          List<Component> selectables = db.components.values.upgrades;

          _showComponentSelector(
            context: context,
            loc: loc,
            components: selectables,
            onSelected: onSelected,
          );
        },
        itemBuilder: (BuildContext context) => [
          const PopupMenuItem(value: "Upgrade", child: Text("Upgrade")),
        ],
        child: const Icon(Icons.add),
      );
    } else {
      return PopupMenuButton<ComponentType>(
        tooltip: "Add car components",
        shape: RoundedRectangleBorder(borderRadius: radiusM),
        offset: const Offset(0, 30),
        onSelected: (item) {
          List<Component> selectables;

          switch (item) {
            case ComponentType.accessory:
              selectables = db.components.values.accessories;
              break;
            case ComponentType.structure:
              selectables = db.components.values.structure;
              break;
            case ComponentType.weapon:
              selectables =
                  db.components.values.weapons.where((value) => !value.attributes.contains(Attribute.turret)).toList();
              break;
            default:
              selectables = const [];
          }

          _showComponentSelector(
            context: context,
            loc: loc,
            components: selectables,
            onSelected: onSelected,
          );
        },
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(value: ComponentType.weapon, child: Text(ComponentType.weapon.toString())),
          PopupMenuItem(value: ComponentType.accessory, child: Text(ComponentType.accessory.toString())),
          PopupMenuItem(value: ComponentType.structure, child: Text(ComponentType.structure.toString())),
        ],
        child: const Icon(Icons.add),
      );
    }
  }

  void _showComponentSelector({
    required BuildContext context,
    required Location loc,
    required List<Component> components,
    required CompSelectorCallback onSelected,
  }) {
    final sortedComps = components.toList()..sort((a, b) => a.cost.compareTo(b.cost));
    final instComps = sortedComps.map((value) => ComponentState(id: '', component: value, loc: loc));

    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return ComponentSelector(
          loc: loc,
          division: division,
          components: List<ComponentState>.unmodifiable(instComps),
          onSelected: onSelected,
        );
      }),
    );
  }

  List<ExpandableItem<ComponentState>> _generateComponentItems(List<ComponentState> value) {
    return value.map<ExpandableItem<ComponentState>>((component) {
      return ExpandableItem<ComponentState>(
        headerBuilder: (context, isExpanded) => Padding(
          padding: const EdgeInsets.only(top: sm),
          child: ComponentHeader(
            component: component,
            onSelected: component.name != 'Hand Cannon' ? () => onRemoved(component) : null,
            selectionText: "Remove",
          ),
        ),
        bodyBuilder: (context, isExpanded) {
          return ComponentBody(component: component, expandable: true);
        },
        data: component,
      );
    }).toList();
  }
}

class _NameInput extends StatelessWidget {
  static const inputName = "Name";

  final RequiredStringFormField field;
  final ValueChanged<String> onChanged;

  const _NameInput({Key? key, required this.field, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('cb_${inputName}_textField'),
      initialValue: field.value,
      autofocus: true,
      onChanged: onChanged,
      // onChanged: (value) => ref.read(carBuilderCtrlProvider.notifier).usernameChanged(value),
      keyboardType: TextInputType.name,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        labelText: inputName,
        errorText: field.invalid ? field.error!.errorMsg : null,
        isDense: true,
      ),
    );
  }
}
