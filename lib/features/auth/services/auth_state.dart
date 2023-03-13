import 'package:appwrite/models.dart';

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
    Session? session,
    Account? account,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      session: session ?? this.session,
      account: account ?? this.account,
    );
  }

  AuthState logout() {
    return const AuthState();
  }

  bool get hasSession => session != null;
  bool get hasAccount => account != null;
  bool get isLoggedIn => hasSession;

  String get uid => account?.$id ?? '';
  String get username => account?.name ?? '';
}