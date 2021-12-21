import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/constants/styles.dart';
import 'package:food_app/presentation/widgets/custom_card.dart';
import 'package:food_app/presentation/widgets/custom_modal_bottom_sheet.dart';
import 'package:food_app/presentation/widgets/custom_outlined_button.dart';
import 'package:food_app/presentation/widgets/custom_text_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Change Password',
              textAlign: TextAlign.center,
              style: KTitle1,
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomCard(
              children: [
                CustomTextField(
                  hint: 'New Password',
                  onChanged: (String value) {
                    print(value);
                  },
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_off),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  hint: 'Confirm Password',
                  onChanged: (String value) {
                    print(value);
                  },
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_off),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomOutlinedButton(
              text: 'Update Password',
              primaryColor: Colors.white,
              backgroundColor: Theme.of(context).primaryColor,
              borderColor: Colors.white,
              onPressed: () {
                loadingModalSheet(context);
              },
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
