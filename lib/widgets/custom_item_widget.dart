import 'package:do_it_flutter_v2/utils/app_width.dart';
import 'package:flutter/material.dart';

class CustomItemWidget extends StatelessWidget {
  void Function()? deleteItem;
  void Function()? onTap;
  void Function()? tapOnIcon;
  IconData? icon;
  Color? iconColor;
  TextStyle? textStyle;
  String? text;

  CustomItemWidget(
      {this.icon,
      this.iconColor,
      this.text,
      this.textStyle,
      this.onTap,
      this.deleteItem,
      this.tapOnIcon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => tapOnIcon,
          icon: Icon(icon ?? Icons.circle),
          iconSize: 17,
          color: iconColor,
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            "${text ?? ''}",
            style: textStyle,
          ),
        ),
        AppWidth.expanded,
        IconButton(
          onPressed: () => deleteItem,
          icon: Icon(Icons.close),
          iconSize: 17,
        ),
      ],
    );
  }
}
