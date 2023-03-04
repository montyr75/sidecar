import 'package:appwrite/models.dart';
import 'package:quiver/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app_config.dart';
import '../repo/auth_repo.dart';
import 'auth_state.dart';

part 'auth_service.g.dart';

@Riverpod(keepAlive: true)
class AuthService extends _$AuthService {
  @override
  AuthState build() => const AuthState();

  Future<void> login({required String email, required String password}) async {
    if (!state.isLoading) {
      state = state.copyWith(isLoading: true);
    }

    final session = await ref.read(authRepoProvider).login(email: email, password: password);

    if (session != null) {
      state = state.copyWith(
        isLoading: false,
        // user: account,
      );

      log.info("AuthService::login() -- LOGGED IN!! -> ${state.user}");
    }
    else {
      state = state.copyWith(isLoading: false);
    }
  }

  void logout() {
    ref.read(authRepoProvider).logout();

    state = state.copyWith(
      user: const Optional<Account?>.absent(),
    );
  }
}