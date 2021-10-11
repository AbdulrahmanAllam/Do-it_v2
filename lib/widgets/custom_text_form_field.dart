import 'package:do_it_flutter_v2/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String? Function(String?)? validator;
  void Function(String?)? onSaved;
  IconData? icon;
  String? hintText;
  String? initialValue;
  int? maxLength;
  int? maxLines;

  CustomTextFormField(
      {this.validator,
      this.onSaved,
      this.icon,
      this.hintText,
      this.initialValue,
      this.maxLength,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return TextFormField(
        initialValue: initialValue,
        cursorColor: AppColors.black,
        validator: validator,
        onSaved: onSaved,
        maxLength: maxLength,
        maxLines: maxLines,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.black),
          ),

          hintText: hintText,
          prefixIcon: Icon(
            icon,
            color: AppColors.black,
          ),
          // icon: Icon(Icons.email),
        ),
      );
    } else {
      return TextFormField(
        initialValue: initialValue,
        cursorColor: AppColors.black,
        validator: validator,
        onSaved: onSaved,
        maxLength: maxLength,
        maxLines: maxLines,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.black),
          ),
          hintText: hintText,
          // icon: Icon(Icons.email),
        ),
      );
    }
  }
}
