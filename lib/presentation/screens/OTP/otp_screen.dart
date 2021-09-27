import 'package:flutter/material.dart';
import 'package:food_app/constants/original_screen_dimensions.dart';
import 'package:food_app/presentation/widgets/main_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Forget\nPassword',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'You will shortly recieve a message with a code\nto set up a new password',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,

                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(15),
                      fieldHeight: 70,
                      fieldWidth: 70,
                      activeFillColor: const Color.fromARGB(255, 225, 226, 233),
                      activeColor: const Color.fromARGB(255, 225, 226, 233),
                      inactiveFillColor: Colors.grey[300],
                      selectedFillColor: Colors.white,
                      inactiveColor: Colors.white,
                      fieldOuterPadding: null),
                  animationDuration: const Duration(milliseconds: 100),
                  enableActiveFill: true,
                  //errorAnimationController: errorController,
                  //controller: textEditingController,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                  },
                  appContext: context,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MainButton(
                title: 'Restore Password',
                onPressed: () {},
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend Confirmation code (1:08)',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
