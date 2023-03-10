import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../db/appwrite.dart';
import '../../../services/error/error_service.dart';

part 'auth_repo.g.dart';

const savedBuildsCollectionID = '64050cb357bad2510213';

@riverpod
AuthRepo authRepo(AuthRepoRef ref) {
  return AuthRepo(
    ref: ref,
    accountService: ref.watch(appwriteAccountServiceProvider),
  );
}

class AuthRepo {
  final AuthRepoRef ref;
  final Account _accountService;

  const AuthRepo({
    required this.ref,
    required Account accountService,
  })  : _accountService = accountService;

  Future<models.Account?> register({required String username, required String email, required String password}) async {
    try {
      return await _accountService.create(
        userId: ID.unique(),
        name: username,
        email: email,
        password: password,
      );
    } catch (e, st) {
      _handleError(e, st);
      return null;
    }
  }

  Future<models.Session?> login({required String email, required String password}) async {
    try {
      return await _accountService.createEmailSession(
        email: email,
        password: password,
      );
    } catch (e, st) {
      _handleError(e, st);
      return null;
    }
  }

  Future<models.Session?> getActiveSession(String sessionID) async {
    try {
      return await _accountService.getSession(sessionId: sessionID);
    } catch (e, st) {
      _handleError(e, st);
      return null;
    }
  }

  Future<models.Account?> getActiveAccount() async {
    try {
      return await _accountService.get();
    } catch (e, st) {
      _handleError(e, st);
      return null;
    }
  }

  Future logout(String sessionId) async {
    try {
      return _accountService.deleteSession(sessionId: sessionId);
    } catch (e, st) {
      _handleError(e, st);
      return null;
    }
  }

  void _handleError(Object e, StackTrace st) {
    // AppwriteException error types: https://appwrite.io/docs/response-codes

    final errorService = ref.read(errorServiceProvider.notifier);

    if (e is AppwriteException) {
      String? message;

      switch (e.type) {
        case "user_email_already_exists":
        case "user_already_exists":
          message = "That email address is already in use.";
          break;
        case "general_argument_invalid": // for auth, this would likely be a too-short password
        case "user_invalid_credentials":
          message = "Bad username or password.";
          break;
        case "user_unauthorized":
          message = "Unauthorized.";
          break;
        case "user_not_found":
          message = "User not found.";
          break;
        case "user_session_not_found":
          message = "Session not found.";
          break;
      }

      errorService.onError(
        provider: authRepoProvider,
        error: AppError(
          error: e,
          message: message ?? "Unknown server error.",
          showAlert: true,
        ),
        st: st,
      );
    } else {
      errorService.onError(
        provider: authRepoProvider,
        error: AppError(
          error: e,
          showAlert: true,
        ),
        st: st,
      );
    }
  }
}
