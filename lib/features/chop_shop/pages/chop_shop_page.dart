import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/page_nav_button.dart';
import '../controllers/chop_shop/chop_shop_ctrl.dart';

class ChopShopPage extends ConsumerWidget {
  const ChopShopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chopShopCtrlProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Chop Shop",
          style: TextStyle(
            fontFamily: "Blazed",
            fontSize: 22,
            color: Colors.blueGrey,
          ),
        ),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: .4,
            image: AssetImage('assets/images/chopshop1.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PageNavButton(
                label: "Enter the Shop",
                desc: "Build a new vehicle",
                onPressed: () => context.pushNamed(AppRoute.carBuilder.name),
              ),
              boxXXL,
              PageNavButton(
                label: "The Garage",
                desc: "Manage your vehicles (${state.savedBuilds.vehicles.length})",
                onPressed: () => context.pushNamed(AppRoute.carBuilder.name),
              ),
              boxXXL,
              PageNavButton(
                label: "Vehicle Guide",
                desc: "Modify prebuilt vehicles",
                onPressed: () => context.goNamed(AppRoute.carBuilder.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
