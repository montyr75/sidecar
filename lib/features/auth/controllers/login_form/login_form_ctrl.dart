import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../models/form_models.dart';
import '../../services/auth_service.dart';
import 'login_form_state.dart';

part 'login_form_ctrl.g.dart';

@riverpod
class LoginFormCtrl extends _$LoginFormCtrl {
  @override
  LoginFormState build() {
    // final authState = ref.read(authServiceProvider);
    //
    // if (!authState.canAutoLogin && authState.canPrefill) {
    //   return LoginFormState(
    //     email: RequiredEmailFormField.pure(authState.email!),
    //   );
    // }

    return const LoginFormState();
  }

  void emailChanged(String value) {
    _setValidatedState(state.copyWith(
      email: RequiredEmailFormField.dirty(value),
    ));
  }

  void passwordChanged(String value) {
    _setValidatedState(state.copyWith(
      password: RequiredStringFormField.dirty(value),
    ));
  }

  void submit() {
    if (state.status.isValid) {
      final authService = ref.read(authServiceProvider.notifier);

      authService.login(
        email: state.email.value,
        password: state.password.value,
      );
    }
  }

  /// Set a state with updated validation.
  void _setValidatedState(LoginFormState value) {
    state = value.copyWith(
      status: Formz.validate(value.validationFields),
    );
  }}