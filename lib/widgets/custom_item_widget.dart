import 'package:do_it_flutter_v2/utils/app_colors.dart';
import 'package:do_it_flutter_v2/utils/app_width.dart';
import 'package:flutter/material.dart';

class CustomItemWidget extends StatelessWidget {
  void Function()? deleteItem;
  void Function() onChange;
  bool check;
  TextStyle? textStyle;
  String? text;

  CustomItemWidget(
      {required this.check,
      this.text,
      this.textStyle,
      this.deleteItem,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: check,
            onChanged: (value) {
              onChange();
            },
            // checkColor: AppColors.grey,
          activeColor:  AppColors.grey,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "${text ?? ''}",
          style: textStyle,
        ),
        AppWidth.expanded,
        IconButton(
          onPressed: deleteItem,
          icon: Icon(Icons.close),
          iconSize: 17,
        ),
      ],
    );
  }
}
