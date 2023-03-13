import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';

import '../../data/damage.dart';
import '../../routes.dart';
import '../../utils/screen_utils.dart';
import '../../widgets/internal_damage_sequence_display.dart';
import '../../widgets/panel_list.dart';
import '../../widgets/png_icon.dart';
import 'controller/vehicle_state.dart';
import 'widgets/crew/crew_body.dart';
import 'widgets/dashboard/dashboard.dart';
import 'widgets/dice_matrix.dart';
import 'widgets/enhancements/enhancements_body.dart';
import 'widgets/weapons/weapons_body.dart';

class VehicleRecordSheetPage extends ConsumerStatefulWidget {
  final VehicleState initialState;

  const VehicleRecordSheetPage({Key? key, required this.initialState}) : super(key: key);

  @override
  ConsumerState createState() => _VehicleRecordSheetPageState();
}

class _VehicleRecordSheetPageState extends ConsumerState<VehicleRecordSheetPage> {
  late final List<ExpandableItem> _allItems;

  bool _internalDamageSequenceShowing = false;

  @override
  void initState() {
    super.initState();

    // TODO: Check screen size here to see if the dashboard, etc., will fit.
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    // ]);

    const itemPadding = EdgeInsets.fromLTRB(0, med, xxl + 40, med);

    _allItems = [
      ExpandableItem(
        headerBuilder: (context, isExpanded) => GestureDetector(
          onTap: () => setState(() {
            _allItems[0].toggle();
          }),
          child: const PanelHeader(text: "CREW"),
        ),
        bodyBuilder: (context, isExpanded) => Padding(
          padding: itemPadding,
          child: CrewBody(initialState: widget.initialState),
        ),
        isExpanded: false,
      ),
      ExpandableItem(
        headerBuilder: (context, isExpanded) => GestureDetector(
          onTap: () => setState(() {
            _allItems[1].toggle();
          }),
          child: const PanelHeader(text: "WEAPONS"),
        ),
        bodyBuilder: (context, isExpanded) => Padding(
          padding: itemPadding,
          child: WeaponsBody(initialState: widget.initialState),
        ),
        isExpanded: false,
      ),
      ExpandableItem(
        headerBuilder: (context, isExpanded) => GestureDetector(
          onTap: () => setState(() {
            _allItems[2].toggle();
          }),
          child: const PanelHeader(text: "DASHBOARD"),
        ),
        bodyBuilder: (context, isExpanded) => const Padding(
          padding: itemPadding,
          child: Center(child: Dashboard()),
        ),
        isExpanded: true,
      ),
      if (widget.initialState.hasAccessories || widget.initialState.hasUpgrades || widget.initialState.hasStructure)
        ExpandableItem(
          headerBuilder: (context, isExpanded) => GestureDetector(
            onTap: () => setState(() {
              _allItems[3].toggle();
            }),
            child: const PanelHeader(text: "ENHANCEMENTS"),
          ),
          bodyBuilder: (context, isExpanded) => Padding(
            padding: itemPadding,
            child: EnhancementsBody(initialState: widget.initialState),
          ),
          isExpanded: false,
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          tooltip: "Home",
          onPressed: !_internalDamageSequenceShowing ? () => context.goNamed(AppRoute.home.name) : null,
          icon: const Icon(Icons.home),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 60.0),
          child: Text(
            widget.initialState.vehicle.name,
            style: const TextStyle(
              fontSize: 22,
              fontFamily: 'Blazed',
              color: Colors.blueGrey,
            ),
          ),
        ),
        actions: [
          Builder(builder: (context) {
            return IconButton(
              tooltip: "Dice Matrix",
              onPressed: !_internalDamageSequenceShowing ? () => _showDiceMatrix(context) : null,
              icon: const PngIcon(name: "dice"),
            );
          }),
          Builder(builder: (context) {
            return IconButton(
              tooltip: "Internal Damage",
              onPressed: !_internalDamageSequenceShowing ? () => _showInternalDamageSequence(context) : null,
              icon: const PngIcon(name: "bang"),
            );
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: paddingAllM,
          child: PanelList(
            key: const ValueKey('all_list'),
            items: _allItems,
          ),
        ),
      ),
    );
  }

  void _showInternalDamageSequence(BuildContext context) {
    final size = widget.initialState.vehicle.division <= 6 ? InternalDamageCarSize.small : InternalDamageCarSize.big;

    final seq = internalDamageSequences[size]!.toList()..shuffle();

    setState(() {
      _internalDamageSequenceShowing = true;
    });

    showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return SizedBox(
          height: 165,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: InternalDamageSequenceDisplay(seq: seq.first, size: size),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.chevron_left_rounded),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ).closed.whenComplete(() {
      setState(() {
        _internalDamageSequenceShowing = false;
      });
    });
  }

  void _showDiceMatrix(BuildContext context) {
    SmartDialog.show(builder: (_) {
      return const SimpleDialog(
        backgroundColor: Colors.grey,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: med),
            child: DiceMatrix(),
          ),
        ],
      );
    });
  }

// @override
// void dispose() {
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//
//   super.dispose();
// }
}

class PanelHeader extends StatelessWidget {
  final String text;

  const PanelHeader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white12,
            Colors.black12,
            Colors.black54,
            Colors.black12,
            Colors.white12,
          ],
        ),
      ),
      alignment: Alignment.center,
      child: Text(text, style: const TextStyle(fontFamily: 'Facon', color: Colors.blueGrey)),
    );
  }
}
