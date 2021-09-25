part of '../sign_up_screen.dart';

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          (previous.password != current.password) ||
          previous.hidePassword != current.hidePassword,
      builder: (context, state) {
        return CustomTextField(
          hint: 'Password',
          errorText: state.password.invalid
              ? '''Password must be at least 8 characters and contain at least one letter and number'''
              : null,
          obscureText: state.hidePassword,
          suffixIcon: IconButton(
            icon: Icon(state.hidePassword
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined),
            onPressed: () {
              context.read<SignUpCubit>().togglePassword();
            },
          ),
          onChanged: (value) {
            context.read<SignUpCubit>().passwordChanged(value);
          },
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}
