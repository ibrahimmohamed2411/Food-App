part of '../sign_up_screen.dart';

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpValidationCubit, SignUpValidationState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return MainButton(
            title: 'Sign Up'
                '',
            onPressed: state.signUpButtonAction(context));
      },
    );
  }
}
