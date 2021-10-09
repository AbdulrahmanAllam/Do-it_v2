import 'package:do_it_flutter_v2/objects/task/task.dart';
import 'package:flutter/material.dart';

import '../../tasks.dart';

class TasksListProvider extends ChangeNotifier {
  Tasks _tasksObject = Tasks();
  List<Task>? _tasks;

  Future<int?> getTasks({required BuildContext context}) async {
    int? status;
    await _tasksObject.getTasks().then(
      (value) {
        if (value != null && value.isNotEmpty) {
          status = 1;
          _tasks = value;
        }
      },
    );
    return status;
  }

  void refresh() => notifyListeners();

  List<Task>? get tasks => _tasks;
}
