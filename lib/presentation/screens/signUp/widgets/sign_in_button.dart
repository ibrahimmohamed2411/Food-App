part of '../sign_up_screen.dart';

class _SignInButton extends StatelessWidget {
  const _SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return MainButton(
          title: 'Sign In',
          onPressed: state.status.isValidated
              ? () => context.read<SignUpCubit>().signUp()
              : null,
        );
      },
    );
  }
}
