import 'package:appwrite/models.dart';
import 'package:quiver/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app_config.dart';
import '../repos/auth_repo.dart';
import 'auth_state.dart';

part 'auth_service.g.dart';

@Riverpod(keepAlive: true)
class AuthService extends _$AuthService {
  @override
  AuthState build() => const AuthState();

  Future<void> register({required String username, required String email, required String password}) async {
    state = state.copyWith(isLoading: true);

    final account = await ref.read(authRepoProvider).register(username: username, email: email, password: password);

    if (account != null) {
      log.info("AuthService::register() -- ACCOUNT CREATED: ${account.email}");

      state = state.copyWith(
        account: Optional<Account?>.of(account),
      );

      login(email: email, password: password);
    }
    else {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> login({required String email, required String password}) async {
    if (!state.isLoading) {
      state = state.copyWith(isLoading: true);
    }

    final repo = ref.read(authRepoProvider);

    final session = await repo.login(email: email, password: password);

    Account? account;

    if (session != null) {
      if (!state.hasAccount) {
        account = await repo.getActiveAccount();
      }

      state = state.copyWith(
        isLoading: false,
        session: Optional<Session?>.of(session),
        account: Optional<Account?>.of(account),
      );

      log.info("AuthService::login() -- LOGGED IN!! -> ${state.session}");
    }
    else {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> logout() async {
    if (state.hasSession) {
      await ref.read(authRepoProvider).logout(state.session!.$id);
      state = state.logout();

      log.info("AuthService::logout() -- LOGGED OUT!!");
    }
  }
}