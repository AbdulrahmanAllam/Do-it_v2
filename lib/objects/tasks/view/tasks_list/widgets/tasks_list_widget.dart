
import 'package:do_it_flutter_v2/objects/task/task.dart';
import 'package:do_it_flutter_v2/objects/task/ui/task_item/task_item_widget.dart';
import 'package:flutter/material.dart';

class TasksListWidget extends StatelessWidget {
  List<Task>? _tasks;

  TasksListWidget({required List<Task>? tasks}) : _tasks = tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _tasks?.length,
        itemBuilder: (context, index) => TaskItemWidget(),
    );
  }
}
