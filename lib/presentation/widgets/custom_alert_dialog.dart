import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_outlined_button.dart';

Future<bool?> customAlertDialog(BuildContext context) async {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (ctx) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: const Center(
        child: Text('Login Out'),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Are you sure you want to log out?',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          CustomOutlinedButton(
            text: 'Login Out',
            primaryColor: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            borderColor: Theme.of(context).primaryColor,
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomOutlinedButton(
            backgroundColor: Theme.of(context).primaryColor,
            borderColor: Theme.of(context).primaryColor,
            primaryColor: Colors.white,
            text: 'Cancel',
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        ],
      ),
      elevation: 50,
    ),
  );
}
