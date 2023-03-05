import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import '../../../utils/screen_utils.dart';
import '../controllers/registration_form/registration_form.dart';
import '../services/auth_service.dart';

const formName = 'reg_form';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLoginSection(context),
        boxXXL,
        const _SubmitButton(),
      ],
    );
  }

  Widget _buildLoginSection(BuildContext context) {
    return AutofillGroup(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          _UsernameInput(),
          boxXXL,
          _EmailInput(),
          boxXXL,
          _PasswordInput(),
          boxXXL,
          _ConfirmPasswordInput(),
        ],
      ),
    );
  }
}

class _UsernameInput extends ConsumerWidget {
  static const inputName = "Username";

  const _UsernameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final field = ref.watch(registrationFormCtrlProvider.select((state) => state.username));

    return TextFormField(
      key: const Key('${formName}_${inputName}_textField'),
      initialValue: field.value,
      autofocus: true,
      onChanged: (value) => ref.read(registrationFormCtrlProvider.notifier).usernameChanged(value),
      onFieldSubmitted: (_) => ref.read(registrationFormCtrlProvider.notifier).submit(),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      enableSuggestions: false,
      autocorrect: false,
      autofillHints: const [AutofillHints.username],
      decoration: InputDecoration(
        labelText: inputName,
        errorText: field.invalid ? field.error!.errorMsg : null,
        isDense: true,
      ),
    );
  }
}

class _EmailInput extends ConsumerWidget {
  static const inputName = "Email";

  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final field = ref.watch(registrationFormCtrlProvider.select((state) => state.email));

    return TextFormField(
      key: const Key('${formName}_${inputName}_textField'),
      initialValue: field.value,
      onChanged: (value) => ref.read(registrationFormCtrlProvider.notifier).emailChanged(value),
      onFieldSubmitted: (_) => ref.read(registrationFormCtrlProvider.notifier).submit(),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      enableSuggestions: false,
      autocorrect: false,
      autofillHints: const [AutofillHints.email],
      decoration: InputDecoration(
        labelText: inputName,
        errorText: field.invalid ? field.error!.errorMsg : null,
        isDense: true,
      ),
    );
  }
}

class _PasswordInput extends ConsumerWidget {
  static const inputName = "Password";

  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final field = ref.watch(registrationFormCtrlProvider.select((state) => state.password));

    return TextFormField(
      key: const Key('${formName}_${inputName}_textField'),
      initialValue: field.value,
      // obscureText: true,
      onChanged: (value) => ref.read(registrationFormCtrlProvider.notifier).passwordChanged(value),
      onFieldSubmitted: (_) => ref.read(registrationFormCtrlProvider.notifier).submit(),
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      enableSuggestions: false,
      autocorrect: false,
      autofillHints: const [AutofillHints.newPassword],
      decoration: InputDecoration(
        labelText: inputName,
        errorText: field.invalid ? field.error!.errorMsg : null,
        isDense: true,
      ),
    );
  }
}

class _ConfirmPasswordInput extends ConsumerWidget {
  static const inputName = "Confirm Password";

  const _ConfirmPasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final field = ref.watch(registrationFormCtrlProvider.select((state) => state.confirmPassword));

    return TextFormField(
      key: const Key('${formName}_${inputName}_textField'),
      initialValue: field.value,
      // obscureText: true,
      onChanged: (value) => ref.read(registrationFormCtrlProvider.notifier).confirmPasswordChanged(value),
      onFieldSubmitted: (_) => ref.read(registrationFormCtrlProvider.notifier).submit(),
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.go,
      enableSuggestions: false,
      autocorrect: false,
      autofillHints: const [AutofillHints.newPassword],
      decoration: InputDecoration(
        labelText: inputName,
        errorText: field.invalid ? field.error!.errorMsg : null,
        isDense: true,
      ),
    );
  }
}

class _SubmitButton extends ConsumerWidget {
  static const inputName = "Register";

  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(registrationFormCtrlProvider.select((state) => state.status));
    final isLoading = ref.watch(authServiceProvider.select((state) => state.isLoading));

    return SizedBox(
      height: 35,
      child: !isLoading
          ? ElevatedButton(
        key: const Key('${formName}_${inputName}_button'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        onPressed: status.isValidated ? () => ref.read(registrationFormCtrlProvider.notifier).submit() : null,
        child: const Text(inputName),
      )
          : const CircularProgressIndicator(),
    );
  }
}
