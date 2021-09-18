import 'package:do_it_flutter_v2/utils/app_width.dart';
import 'package:flutter/material.dart';

class CustomItemWidget extends StatelessWidget {
  void Function()? deleteItem;
  void Function()? onTap;
  void Function()? tapOnCircle;
  Color? circleColor;
  TextStyle? textStyle;
  String? text;

  CustomItemWidget(
      {this.circleColor,
      this.text,
      this.textStyle,
      this.onTap,
      this.deleteItem,
      this.tapOnCircle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: tapOnCircle,
          icon: Icon(Icons.circle),
          iconSize: 17,
          color: circleColor,
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
