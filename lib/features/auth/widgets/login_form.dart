import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import '../../../utils/screen_utils.dart';
import '../controllers/login_form/login_form.dart';
import '../services/auth_service.dart';

const formName = 'login_form';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

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
          _EmailInput(),
          boxXXL,
          _PasswordInput(),
        ],
      ),
    );
  }
}

class _EmailInput extends ConsumerWidget {
  static const inputName = "Email";

  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final field = ref.watch(loginFormCtrlProvider.select((state) => state.email));

    return TextFormField(
      key: const Key('${formName}_${inputName}_textField'),
      initialValue: field.value,
      autofocus: true,
      onChanged: ref.read(loginFormCtrlProvider.notifier).emailChanged,
      onFieldSubmitted: (_) => ref.read(loginFormCtrlProvider.notifier).submit(),
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
    final field = ref.watch(loginFormCtrlProvider.select((state) => state.password));

    return TextFormField(
      key: const Key('${formName}_${inputName}_textField'),
      initialValue: field.value,
      // obscureText: true,
      onChanged: ref.read(loginFormCtrlProvider.notifier).passwordChanged,
      onFieldSubmitted: (_) => ref.read(loginFormCtrlProvider.notifier).submit(),
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.go,
      enableSuggestions: false,
      autocorrect: false,
      autofillHints: const [AutofillHints.password],
      decoration: InputDecoration(
        labelText: inputName,
        errorText: field.invalid ? field.error!.errorMsg : null,
        isDense: true,
      ),
    );
  }
}

class _SubmitButton extends ConsumerWidget {
  static const inputName = "Log in";

  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(loginFormCtrlProvider.select((state) => state.status));
    final isLoading = ref.watch(authServiceProvider.select((state) => state.isLoading));

    return SizedBox(
      height: 35,
      child: !isLoading
          ? ElevatedButton(
        key: const Key('${formName}_${inputName}_button'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        onPressed: status.isValidated ? () => ref.read(loginFormCtrlProvider.notifier).submit() : null,
        child: const Text(inputName),
      )
          : const CircularProgressIndicator()
    );
  }
}
