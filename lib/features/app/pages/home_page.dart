import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';
import '../../../utils/screen_utils.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Sidecar",
          style: TextStyle(
            fontFamily: "Blazed",
            fontSize: 22,
          ),
        ),
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
              HomeButton(
                label: "Vehicle Guide",
                onPressed: () => context.goNamed(AppRoute.chassisSelector.name),
              ),
              boxXXL,
              HomeButton(
                label: "Car Builder",
                onPressed: () => context.goNamed(AppRoute.carBuilder.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const HomeButton({Key? key, required this.label, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black54,
          side: const BorderSide(width: 2, color: Colors.white30),
          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(med))),
        ),
        onPressed: onPressed,
        child: Container(
          padding: paddingAllXL,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white38,
                Colors.black45,
                Colors.black,
                Colors.black45,
                Colors.white38,
              ],
            ),
            borderRadius: radiusM,
          ),
          child: Text(
            label,
            style: const TextStyle(fontFamily: 'Audiowide', color: Colors.white),
          ),
        ),
      ),
    );
  }
}
