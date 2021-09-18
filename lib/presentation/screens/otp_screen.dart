import 'package:flutter/material.dart';
import 'package:food_app/presentation/widgets/rounded_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(30, 10, 0, 40),
              child: const Text(
                'Forget\nPassword',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(18),
              child: Text(
                'You will shortly recieve a message with a code\nto set up a new password',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
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
                ),
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
            Center(
              child: RoundedButton(
                title: 'Restore Password',
                backgroundColor: const Color.fromARGB(255, 125, 27, 253),
                onPressed: () {},
                foregroundColor: Colors.white,
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Resend Confirmation code (1:08)',
                  style: TextStyle(
                    color: Color.fromARGB(255, 125, 27, 253),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
