import 'package:formz/formz.dart';

import '../../../../../models/form_models.dart';

class LoginFormState {
  // status
  final FormzStatus status;

  // form fields
  final RequiredEmailFormField email;
  final RequiredStringFormField password;

  const LoginFormState({
    this.status = FormzStatus.pure,
    this.email = const RequiredEmailFormField.pure(),
    this.password = const RequiredStringFormField.pure(),
  });

  LoginFormState copyWith({
    FormzStatus? status,
    RequiredEmailFormField? email,
    RequiredStringFormField? password,
  }) {
    return LoginFormState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  List<FormzInput> get validationFields => [
    email,
    password,
  ];

  @override
  String toString() {
    return 'LoginFormState{status: $status, email: $email, password: $password}';
  }
}