import 'package:do_it_flutter_v2/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  void Function()? onPressed;
  String? text;

  CustomMaterialButton({required this.onPressed, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColors.black,
        child: Text(
          "$text",
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
