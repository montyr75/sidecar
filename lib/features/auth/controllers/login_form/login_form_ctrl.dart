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
    // TODO: Set up some secure storage stuff here.

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
      ref.read(authServiceProvider.notifier).login(
        email: state.email.value.trim(),
        password: state.password.value.trim(),
      );
    }
  }

  /// Set a state with updated validation.
  void _setValidatedState(LoginFormState value) {
    state = value.copyWith(
      status: Formz.validate(value.validationFields),
    );
  }}