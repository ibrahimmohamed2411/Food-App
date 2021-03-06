part of '../sign_up_screen.dart';

class _NameInput extends StatelessWidget {
  const _NameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpValidationCubit, SignUpValidationState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return CustomTextField(
          hint: 'Your Name',
          errorText: state.name.invalid ? 'this can not be empty' : null,
          onChanged: (value) {
            context.read<SignUpValidationCubit>().nameChanged(value);
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
