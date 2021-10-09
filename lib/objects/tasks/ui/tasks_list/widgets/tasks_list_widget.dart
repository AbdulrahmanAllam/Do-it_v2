import 'package:do_it_flutter_v2/objects/task/task.dart';
import 'package:do_it_flutter_v2/objects/task/ui/add_task/add_task_screen.dart';
import 'package:do_it_flutter_v2/objects/task/ui/task_item/task_item_provider.dart';
import 'package:do_it_flutter_v2/objects/task/ui/task_item/task_item_widget.dart';
import 'package:do_it_flutter_v2/objects/tasks/ui/tasks_list/tasks_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksListWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TasksListProvider>(context, listen: false);
    return ListView.builder(
      itemCount: provider.tasks?.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            //TODO: go to update task screen
          },
          child: ChangeNotifierProxyProvider<TasksListProvider, TaskItemProvider>(
            create: (_) => TaskItemProvider(),
            update: (_, tasksListProvider, taskItemProvider) => TaskItemProvider(task: tasksListProvider.tasks?[index]),
            child: TaskItemWidget(),
          ),
        );
      },
    );
  }
}
