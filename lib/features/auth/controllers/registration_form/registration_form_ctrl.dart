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
      confirmPassword: RequiredConfirmPasswordFormField.dirty(state.password.value, value),
    ));
  }

  void submit() {
    if (state.status.isValid) {
      final authService = ref.read(authServiceProvider.notifier);

      authService.register(
        email: state.email.value,
        password: state.password.value,
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
