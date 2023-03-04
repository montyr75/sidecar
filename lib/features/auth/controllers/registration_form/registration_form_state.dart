import 'package:formz/formz.dart';

import '../../../../../models/form_models.dart';

class RegistrationFormState {
  // status
  final FormzStatus status;

  // form fields
  final RequiredEmailFormField email;
  final RequiredAppwriteNewPasswordFormField password;
  final RequiredConfirmPasswordFormField confirmPassword;

  const RegistrationFormState({
    this.status = FormzStatus.pure,
    this.email = const RequiredEmailFormField.pure(),
    this.password = const RequiredAppwriteNewPasswordFormField.pure(),
    this.confirmPassword = const RequiredConfirmPasswordFormField.pure(),
  });

  RegistrationFormState copyWith({
    FormzStatus? status,
    RequiredEmailFormField? email,
    RequiredAppwriteNewPasswordFormField? password,
    RequiredConfirmPasswordFormField? confirmPassword,
  }) {
    return RegistrationFormState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  List<FormzInput> get validationFields => [
    email,
    password,
    confirmPassword,
  ];

  @override
  String toString() {
    return 'LoginFormState{status: $status, email: $email, password: $password, confirmPassword: $confirmPassword}';
  }
}