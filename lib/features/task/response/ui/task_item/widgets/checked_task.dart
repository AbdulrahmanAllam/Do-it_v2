import 'package:do_it_flutter_v2/utils/app_colors.dart';
import 'package:do_it_flutter_v2/widgets/custom_item_widget.dart';
import 'package:flutter/material.dart';

import '../../../../task.dart';

class CheckedTask extends StatelessWidget {
  late Task _task;

  CheckedTask({required Task task}) : _task = task;

  @override
  Widget build(BuildContext context) {
    return CustomItemWidget(
      text: "${_task.title}",
      circleColor: AppColors.grey,
      textStyle: TextStyle(decoration: TextDecoration.lineThrough),
      tapOnCircle: () { _task.check();}
    );
  }
}
