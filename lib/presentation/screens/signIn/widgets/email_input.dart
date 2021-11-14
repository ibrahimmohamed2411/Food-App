part of '../sign_in_screen.dart';

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInValidationCubit, SignInValidationState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return CustomTextField(
          hint: 'Email',
          errorText: state.email.invalid
              ? 'Please ensure the email entered is valid'
              : null,
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            context.read<SignInValidationCubit>().emailChanged(value);
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
