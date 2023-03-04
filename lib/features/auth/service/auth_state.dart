import 'package:appwrite/models.dart';
import 'package:quiver/core.dart';

class AuthState {
  final bool isLoading;
  final Account? user;

  const AuthState({
    this.isLoading = false,
    this.user,
  });

  AuthState copyWith({
    bool? isLoading,
    Optional<Account?>? user,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user == null ? this.user : user.orNull,
    );
  }

  bool get isLoggedIn => user != null;
}