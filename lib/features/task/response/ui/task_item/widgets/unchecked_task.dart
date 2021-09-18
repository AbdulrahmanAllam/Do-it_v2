import 'package:do_it_flutter_v2/widgets/custom_item_widget.dart';
import 'package:flutter/material.dart';

import '../../../../task.dart';

class UncheckedTask extends StatelessWidget {
  late Task _task;

  UncheckedTask({required Task task}) : _task = task;

  @override
  Widget build(BuildContext context) {
    return CustomItemWidget(
        text: "${_task.title}",
        circleColor: Color(_task.category?.color ?? 0),
        tapOnCircle: () {
          _task.check();
        });
  }
}
