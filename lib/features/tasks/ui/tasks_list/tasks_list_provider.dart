import 'package:do_it_flutter_v2/features/task/task.dart';
import 'package:flutter/material.dart';
import '../../tasks.dart';

class TasksListProvider extends ChangeNotifier {
  Tasks _tasks = Tasks();

  Future<List<Task>?> getTasks({required BuildContext context}) async {
    return await _tasks.getTasks();
  }
}
