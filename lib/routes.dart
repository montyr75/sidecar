import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'features/app/pages/home_page.dart';
import 'features/app/pages/not_found_page.dart';
import 'features/car_builder/car_builder_page.dart';
import 'features/car_record_sheet/car_record_sheet_page.dart';
import 'features/car_selector/chassis_selector_page.dart';
import 'services/app/app_service.dart';

part 'routes.g.dart';

enum AppRoute {
  home('/'),
  carBuilder,
  carRecordSheet,
  chassisSelector,
  login;

  final String? _path;
  String get path => _path ?? name;

  const AppRoute([this._path]);
}

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  // when needed, we can use the ref to watch an authRepo here, then add a redirect to the GoRouter

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    observers: [FlutterSmartDialog.observer],
    routes: [
      GoRoute(
        name: AppRoute.home.name,
        path: AppRoute.home.path,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            name: AppRoute.login.name,
            path: AppRoute.login.path,
            builder: (context, state) => const Center(child: Placeholder()),
          ),
          GoRoute(
            name: AppRoute.chassisSelector.name,
            path: AppRoute.chassisSelector.path,
            builder: (context, state) => const ChassisSelectorPage(),
          ),
          GoRoute(
            name: AppRoute.carBuilder.name,
            path: AppRoute.carBuilder.path,
            builder: (context, state) => const CarBuilderPage(),
          ),
          GoRoute(
            name: AppRoute.carRecordSheet.name,
            path: AppRoute.carRecordSheet.path,
            builder: (context, state) => CarRecordSheetPage(initialState: ref.read(appServiceProvider).initialCarState!),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
  );
}
