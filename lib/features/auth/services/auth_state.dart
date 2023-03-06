import 'package:appwrite/models.dart';

import '../../../db/models/saved_builds.dart';

class AuthState {
  final bool isLoading;
  final Session? session;
  final Account? account;
  final SavedBuilds? savedBuilds;

  const AuthState({
    this.isLoading = false,
    this.session,
    this.account,
    this.savedBuilds,
  });

  AuthState copyWith({
    bool? isLoading,
    Session? session,
    Account? account,
    SavedBuilds? savedBuilds,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      session: session ?? this.session,
      account: account ?? this.account,
      savedBuilds: savedBuilds ?? this.savedBuilds,
    );
  }

  AuthState logout() {
    return const AuthState();
  }

  bool get hasSession => session != null;
  bool get hasAccount => account != null;
  bool get isLoggedIn => hasSession;

  String get uid => account?.$id ?? '';
}