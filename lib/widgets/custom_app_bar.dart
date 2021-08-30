import 'package:do_it_flutter_v2/utils/app_colors.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(
    {String? title,
    Widget? leading,
    bool? centerTitle,
    List<Widget>? actions}) {
  return AppBar(
    leading: leading,
    actions: actions,
    centerTitle: centerTitle,
    title: Text(
      "${title ?? ''}",
      style: TextStyle(color: AppColors.black),
    ),
  );
}
