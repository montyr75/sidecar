import 'package:formz/formz.dart';

import '../../../../../models/form_models.dart';

class RegistrationFormState {
  // status
  final FormzStatus status;

  // form fields
  final RequiredStringFormField username;
  final RequiredEmailFormField email;
  final RequiredAppwriteNewPasswordFormField password;
  final RequiredConfirmPasswordFormField confirmPassword;

  const RegistrationFormState({
    this.status = FormzStatus.pure,
    this.username = const RequiredStringFormField.pure(),
    this.email = const RequiredEmailFormField.pure(),
    this.password = const RequiredAppwriteNewPasswordFormField.pure(),
    this.confirmPassword = const RequiredConfirmPasswordFormField.pure(),
  });

  RegistrationFormState copyWith({
    FormzStatus? status,
    RequiredStringFormField? username,
    RequiredEmailFormField? email,
    RequiredAppwriteNewPasswordFormField? password,
    RequiredConfirmPasswordFormField? confirmPassword,
  }) {
    return RegistrationFormState(
      status: status ?? this.status,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  List<FormzInput> get validationFields => [
    username,
    email,
    password,
    confirmPassword,
  ];
}