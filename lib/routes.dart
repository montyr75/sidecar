import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'features/app/pages/home_page.dart';
import 'features/app/pages/not_found_page.dart';
import 'features/auth/pages/login_page.dart';
import 'features/auth/services/auth_service.dart';
import 'features/car_record_sheet/car_record_sheet_page.dart';
import 'features/chop_shop/pages/car_builder_page.dart';
import 'features/chop_shop/pages/chop_shop_page.dart';
import 'features/vehicle_guide/vehicle_guide_build.dart';
import 'features/vehicle_guide/vehicle_guide_drive.dart';
import 'services/app/app_service.dart';

part 'routes.g.dart';

enum AppRoute {
  home('/'),
  carBuilder,
  carRecordSheet,
  vehicleGuideDrive,
  vehicleGuideBuild,
  chopShop,
  login('/login');

  final String? _path;
  String get path => _path ?? name;

  const AppRoute([this._path]);
}

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    debugLogDiagnostics: false,
    initialLocation: AppRoute.home.path,
    redirect: (context, state) {
      if (!ref.read(authServiceProvider).isLoggedIn) {
        return AppRoute.login.path;
      }

      return null;
    },
    observers: [FlutterSmartDialog.observer],
    routes: [
      GoRoute(
        name: AppRoute.home.name,
        path: AppRoute.home.path,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            name: AppRoute.vehicleGuideDrive.name,
            path: AppRoute.vehicleGuideDrive.path,
            builder: (context, state) => const VehicleGuideDrive(),
          ),
          GoRoute(
            name: AppRoute.chopShop.name,
            path: AppRoute.chopShop.path,
            builder: (context, state) => const ChopShopPage(),
            routes: [
              GoRoute(
                name: AppRoute.vehicleGuideBuild.name,
                path: AppRoute.vehicleGuideBuild.path,
                builder: (context, state) => const VehicleGuideBuild(),
              ),
              GoRoute(
                name: AppRoute.carBuilder.name,
                path: AppRoute.carBuilder.path,
                builder: (context, state) => const CarBuilderPage(),
              ),
            ],
          ),
          GoRoute(
            name: AppRoute.carRecordSheet.name,
            path: AppRoute.carRecordSheet.path,
            builder: (context, state) => CarRecordSheetPage(initialState: ref.read(appServiceProvider).initialCarState!),
          ),
        ],
      ),
      GoRoute(
        name: AppRoute.login.name,
        path: AppRoute.login.path,
        builder: (context, state) => const LoginPage(),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
  );
}
