import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../db/appwrite.dart';
import '../../../services/error/error_service.dart';

part 'auth_repo.g.dart';

@riverpod
Account appwriteAccountService(AppwriteAccountServiceRef ref) {
  return Account(ref.watch(appwriteClientProvider));
}

class AuthRepo {
  final AuthRepoRef ref;
  final Account _accountService;

  const AuthRepo({
    required this.ref,
    required Account accountService,
  }) : _accountService = accountService;

  Future<models.Account?> register({required String email, required String password}) async {
    try {
      final account = await _accountService.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );

      return account;
    }
    catch (e) {
      _handleError(e);
      return null;
    }
  }

  Future<models.Session?> login({required String email, required String password}) async {
    try {
      final session = await _accountService.createEmailSession(
        email: email,
        password: password,
      );

      return session;
    }
    catch (e) {
      _handleError(e);
      return null;
    }
  }

  void logout() {

  }

  void _handleError(Object e) {
    final errorService = ref.read(errorServiceProvider.notifier);

    errorService.onError(
      provider: authRepoProvider,
      error: AppError(
        error: e,
        showAlert: true,
      ),
    );
  }
}

@riverpod
AuthRepo authRepo(AuthRepoRef ref) {
  return AuthRepo(ref: ref, accountService: ref.watch(appwriteAccountServiceProvider));
}