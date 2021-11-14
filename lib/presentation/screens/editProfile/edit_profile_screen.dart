import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/presentation/widgets/custom_card.dart';
import 'package:food_app/presentation/widgets/custom_text_field.dart';
import 'package:food_app/presentation/widgets/menu_item.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.menu,
          color: Colors.black54,
        ),
        actions: const [
          Icon(
            Icons.exit_to_app,
            color: Colors.black54,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Edit Profile',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 80.r,
                          backgroundColor: CupertinoColors.black,
                          child: const FlutterLogo(
                            size: 100,
                            style: FlutterLogoStyle.horizontal,
                          ),
                        ),
                        SizedBox(
                          width: 40.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.cloud_upload_outlined,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            SizedBox(height: 15.h),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text('Account',
                    style: Theme.of(context).textTheme.headline3),
              ),
              SizedBox(height: 20.h),
              CustomCard(
                padding: EdgeInsets.all(25.h),
                children: [
                  CustomTextField(hint: 'Name', onChanged: (val) {}),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextField(hint: 'Phone Number', onChanged: (val) {}),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextField(hint: 'Email', onChanged: (val) {}),
                ],
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text('Notification',
                    style: Theme.of(context).textTheme.headline3),
              ),
              SizedBox(height: 20.h),
              CustomCard(
                padding: EdgeInsets.all(25.h),
                children: const [
                  MenuItem(
                    title: 'Remove Account',
                    icon: Icons.delete,
                    iconColor: Colors.red,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
