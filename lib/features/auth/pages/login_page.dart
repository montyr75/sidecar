import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';
import '../../../utils/screen_utils.dart';
import '../services/auth_service.dart';
import '../widgets/login_form.dart';
import '../widgets/registration_form.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool _loginMode = true;

  @override
  Widget build(BuildContext context) {
    ref.listen(authServiceProvider, (previous, next) {
      if (!(previous?.isLoggedIn ?? false) && next.isLoggedIn) {
        context.goNamed(AppRoute.home.name);
      }
    });

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/flame_fire_wheel.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  padding: paddingAllXXL,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: radiusM,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Sidecar",
                        style: TextStyle(
                            fontFamily: "Blazed",
                            fontSize: 32,
                            color: Colors.blueGrey
                        ),
                      ),
                      const SizedBox(height: 75),
                      _loginMode  ? const LoginForm() : const RegistrationForm(),
                      boxXXL,
                      Text.rich(
                        TextSpan(
                          text: _loginMode ?  "Don't have an account? " : "Aleady have an account? ",
                          children: [
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(0, 5),
                                child: TextButton(
                                  onPressed: !ref.read(authServiceProvider).isLoading ? () {
                                    setState(() {
                                      _loginMode = !_loginMode;
                                    });
                                  } : null,
                                  child: _loginMode ? const Text("Register") : const Text("Log in"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
