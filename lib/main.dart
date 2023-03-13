import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:oktoast/oktoast.dart';

import 'routes.dart';
import 'services/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const ProviderScope(
    child: App(),
  ));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeServiceProvider);

    // final vs = VehicleState.fromVehicle(vg[1]);
    // print(vs);
    // print('\n\n');
    // print(vs.toJson());

    return OKToast(
      duration: const Duration(seconds: 4),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Sidecar',
        theme: themeState.light,
        darkTheme: themeState.dark,
        themeMode: themeState.mode,
        restorationScopeId: 'app',
        routerConfig: ref.watch(goRouterProvider),
        builder: FlutterSmartDialog.init(),
      ),
    );
  }
}
