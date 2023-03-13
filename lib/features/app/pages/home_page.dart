import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/page_nav_button.dart';
import '../../auth/services/auth_service.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sidecar",
          style: TextStyle(
            fontFamily: "Blazed",
            fontSize: 22,
            color: Colors.blueGrey,
          ),
        ),
        actions: [
          if (ref.read(authServiceProvider).isLoggedIn)
            PopupMenuButton<String>(
              tooltip: "User profile",
              shape: RoundedRectangleBorder(borderRadius: radiusM),
              offset: const Offset(0, 50),
              onSelected: (item) async {
                await ref.read(authServiceProvider.notifier).logout();
                ref.read(goRouterProvider).goNamed(AppRoute.login.name);
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(value: "Log out", child: Text("Log out")),
              ],
              child: Container(
                margin: paddingAllM,
                padding: paddingAllM,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      ref.read(authServiceProvider).account!.name,
                      style: const TextStyle(fontFamily: 'Audiowide'),
                    ),
                    boxS,
                    const RotatedBox(
                      quarterTurns: 1,
                      child: Icon(Icons.chevron_right),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/flame_fire_wheel.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PageNavButton(
                label: "Vehicle Guide",
                desc: "Drive prebuilt vehicles",
                onPressed: () => context.goNamed(AppRoute.vehicleGuideDrive.name),
              ),
              boxXXL,
              PageNavButton(
                label: "Chop Shop",
                desc: "Build/Modify vehicles",
                onPressed: () => context.goNamed(AppRoute.chopShop.name),
              ),
              boxXXL,
              PageNavButton(
                label: "The Pit",
                desc: "Load/Manage saved games",
                onPressed: () => context.goNamed(AppRoute.pit.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
