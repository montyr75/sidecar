import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../models/form_models.dart';
import '../../services/auth_service.dart';
import 'registration_form_state.dart';

part 'registration_form_ctrl.g.dart';

@riverpod
class RegistrationFormCtrl extends _$RegistrationFormCtrl {
  @override
  RegistrationFormState build() => const RegistrationFormState();

  void usernameChanged(String value) {
    _setValidatedState(state.copyWith(
      username: RequiredStringFormField.dirty(value),
    ));
  }

  void emailChanged(String value) {
    _setValidatedState(state.copyWith(
      email: RequiredEmailFormField.dirty(value),
    ));
  }

  void passwordChanged(String value) {
    _setValidatedState(state.copyWith(
      password: RequiredAppwriteNewPasswordFormField.dirty(value),
    ));
  }

  void confirmPasswordChanged(String value) {
    _setValidatedState(state.copyWith(
      confirmPassword: RequiredConfirmPasswordFormField.dirty(match: state.password.value, value: value),
    ));
  }

  void submit() {
    if (state.status.isValid) {
      ref.read(authServiceProvider.notifier).register(
        username: state.username.value.trim(),
        email: state.email.value.trim(),
        password: state.password.value.trim(),
      );
    }
  }

  /// Set a state with updated validation.
  void _setValidatedState(RegistrationFormState value) {
    state = value.copyWith(
      status: Formz.validate(value.validationFields),
    );
  }
}