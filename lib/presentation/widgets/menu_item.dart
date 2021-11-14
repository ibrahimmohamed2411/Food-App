import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuItem extends StatelessWidget {
  const MenuItem(
      {Key? key,
      required this.title,
      this.icon,
      this.titleAtStart = false,
      this.trailing,
      this.iconColor})
      : super(key: key);
  final String title;
  final IconData? icon;
  final Color? iconColor;
  final Widget? trailing;
  final bool? titleAtStart;

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(
      icon,
      size: 26.sp,
      color: iconColor ?? Theme.of(context).primaryColor,
    );

    final textWidget =
        Text(title, style: Theme.of(context).textTheme.headline4);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: titleAtStart! ? textWidget : iconWidget,
      title: titleAtStart! ? null : textWidget,
      trailing: trailing,
    );
  }
}
