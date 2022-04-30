import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/logic/cubit/theme/theme_cubit.dart';
import 'package:food_app/presentation/routes/app_router.dart';
import 'package:food_app/presentation/widgets/custom_card.dart';
import 'package:food_app/presentation/widgets/menu_item.dart';

import '../../../logic/cubit/authentication/authentication_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<AuthenticationCubit>(context).signOut();
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.black54,
            ),
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
                      'Profile',
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
                            Text(
                              'Tatiana Shch',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              '+7 923 777 77 77',
                              style: TextStyle(color: Colors.blueGrey[200]),
                            ),
                            SizedBox(height: 15.h),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.r)),
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.5),
                              ),
                              child: const Text('Edit'),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(AppRouter.editProfileScreen);
                              },
                            )
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
                children: const [
                  MenuItem(title: 'Location', icon: Icons.location_on_outlined),
                  Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  MenuItem(
                      title: 'Change Password',
                      icon: Icons.visibility_outlined),
                  Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  MenuItem(title: 'Shipping', icon: Icons.car_rental_outlined),
                  Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  MenuItem(title: 'Payment', icon: Icons.payment_outlined),
                  Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
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
                children: [
                  MenuItem(
                    title: 'App Notifications',
                    titleAtStart: true,
                    trailing: CupertinoSwitch(
                      value: false,
                      onChanged: (v) {},
                      activeColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  MenuItem(
                    title: 'Location Tracking',
                    titleAtStart: true,
                    trailing: CupertinoSwitch(
                      activeColor: Theme.of(context).primaryColor,
                      value: true,
                      onChanged: (v) {},
                    ),
                  ),
                  BlocBuilder<ThemeCubit, bool>(
                    builder: (context, state) {
                      return MenuItem(
                        title: 'Dark Theme',
                        titleAtStart: true,
                        trailing: CupertinoSwitch(
                          activeColor: Theme.of(context).primaryColor,
                          value: state,
                          onChanged: (v) {
                            BlocProvider.of<ThemeCubit>(context).toggleTheme(v);
                          },
                        ),
                      );
                    },
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child:
                    Text('Other', style: Theme.of(context).textTheme.headline3),
              ),
              SizedBox(height: 20.h),
              CustomCard(
                padding: EdgeInsets.all(25.h),
                children: const [
                  MenuItem(
                    title: 'Language',
                    titleAtStart: true,
                  ),
                  Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  MenuItem(
                    title: 'Currency',
                    titleAtStart: true,
                  ),
                  Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
