import 'package:do_it_flutter_v2/features/task/task.dart';
import 'package:do_it_flutter_v2/utils/app_colors.dart';
import 'package:do_it_flutter_v2/widgets/custom_item_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/checked_task.dart';
import 'widgets/unchecked_task.dart';

class TaskItemWidget extends StatelessWidget {
  late Task _task;

  TaskItemWidget({required Task task}) : _task = task;

  @override
  Widget build(BuildContext context) {
    if (_task.done) {
      return CheckedTask(task:_task);
    } else {
      return UncheckedTask(task: _task,);
    }
  }
}
