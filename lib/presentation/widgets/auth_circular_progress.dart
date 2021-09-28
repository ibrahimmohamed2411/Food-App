import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/constants/size_config.dart';
import 'package:food_app/logic/cubit/authentication/authentication_cubit.dart';

class AuthCircularProgress extends StatelessWidget {
  const AuthCircularProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
      if (state is AuthenticationInProgress) {
        return Center(
          child: Padding(
              padding: EdgeInsets.only(
                  bottom: 20 * SizeConfig.scaleFactor.heightScaleFactor),
              child: const CircularProgressIndicator()),
        );
      } else {
        return const SizedBox(
          height: 0,
          width: 0,
        );
      }
    });
  }
}
