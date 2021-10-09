part of '../sign_in_screen.dart';

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInValidationCubit, SignInValidationState>(
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
          suffixIcon: Transform.scale(
            scale: ScreenUtil().scaleHeight,
            child: InkWell(
              onTap: context.read<SignInValidationCubit>().togglePassword,
              child: Icon(
                state.hidePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
          ),
          onChanged: (value) {
            context.read<SignInValidationCubit>().passwordChanged(value);
          },
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}
