import 'package:do_it_flutter_v2/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AddingFloatingActionButton extends StatelessWidget {

  void Function()? onPressed;

  AddingFloatingActionButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(
        Icons.add,
        color: AppColors.white,
      ),
    );
  }
}
