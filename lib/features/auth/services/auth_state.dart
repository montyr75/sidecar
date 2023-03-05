import 'package:appwrite/models.dart';
import 'package:quiver/core.dart';

class AuthState {
  final bool isLoading;
  final Session? session;
  final Account? account;

  const AuthState({
    this.isLoading = false,
    this.session,
    this.account,
  });

  AuthState copyWith({
    bool? isLoading,
    Optional<Session?>? session,
    Optional<Account?>? account,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      session: session == null ? this.session : session.orNull,
      account: account == null ? this.account : account.orNull,
    );
  }

  AuthState logout() {
    return copyWith(
      isLoading: false,
      session: const Optional<Session?>.absent(),
      account: const Optional<Account?>.absent(),
    );
  }

  bool get hasSession => session != null;
  bool get hasAccount => account != null;
  bool get isLoggedIn => hasSession;
}