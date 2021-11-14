import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/styles.dart';
import 'package:food_app/presentation/widgets/custom_card.dart';
import 'package:food_app/presentation/widgets/custom_outlined_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String cardNumber = '';
  String holderName = '';
  String expiryDate = '';
  String CVV = '';
  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 40.w),
                        child: Text(
                          'Payment',
                          style: KTitle1,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Add New',
                          style: TextStyle(
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CreditCardWidget(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: holderName,
                    cvvCode: CVV,
                    showBackView: isCvvFocused,
                    cardBgColor: Colors.black,
                    glassmorphismConfig: Glassmorphism.defaultConfig(),
                    backgroundImage: 'assets/images/card_bg.png',
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    isHolderNameVisible: true,
                    height: 200.h,
                    textStyle: const TextStyle(color: Colors.blue),
                    width: double.infinity,
                    isChipVisible: true,
                    isSwipeGestureEnabled: true,
                    animationDuration: const Duration(milliseconds: 1000),
                    onCreditCardWidgetChange: (c) {},
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 15.w,
                  right: 15.w,
                ),
                child: Column(
                  children: [
                    CustomCard(
                      children: [
                        CreditCardForm(
                          formKey: formKey,
                          obscureCvv: true,
                          obscureNumber: true,
                          cardNumber: cardNumber,
                          cvvCode: CVV,
                          isHolderNameVisible: true,
                          isCardNumberVisible: true,
                          isExpiryDateVisible: true,
                          cardHolderName: holderName,
                          expiryDate: expiryDate,
                          themeColor: Colors.blue,
                          textColor: Colors.black,
                          cardNumberDecoration: const InputDecoration(
                            labelText: 'Number',
                            hintText: 'XXXX XXXX XXXX XXXX',
                            hintStyle: TextStyle(color: Colors.black),
                            labelStyle: TextStyle(color: Colors.black),
                            focusColor: Colors.red,

                            // focusedBorder: border,
                            // enabledBorder: border,
                          ),
                          expiryDateDecoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.black),
                            labelStyle: TextStyle(color: Colors.black),
                            // focusedBorder: border,
                            // enabledBorder: border,
                            labelText: 'Expired Date',
                            hintText: 'XX/XX',
                          ),
                          cvvCodeDecoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.black),
                            labelStyle: TextStyle(color: Colors.black),
                            // focusedBorder: border,
                            // enabledBorder: border,
                            labelText: 'CVV',
                            hintText: 'XXX',
                          ),
                          cardHolderDecoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.black),
                            labelStyle: TextStyle(color: Colors.black),
                            // focusedBorder: border,
                            // enabledBorder: border,
                            labelText: 'Card Holder',
                          ),
                          onCreditCardModelChange: onCreditCardModelChange,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    CustomOutlinedButton(
                      text: 'Update Profile',
                      onPressed: () async {
                        // if (formKey.currentState!.validate()) {
                        //   print('valid!');
                        // } else {
                        //   print('invalid!');
                        // }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      holderName = creditCardModel.cardHolderName;
      CVV = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
