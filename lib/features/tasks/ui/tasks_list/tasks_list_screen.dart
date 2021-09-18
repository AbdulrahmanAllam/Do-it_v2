import 'package:do_it_flutter_v2/features/task/task.dart';
import 'package:do_it_flutter_v2/features/tasks/ui/tasks_list/tasks_list_provider.dart';
import 'package:do_it_flutter_v2/utils/log.dart';
import 'package:do_it_flutter_v2/utils/app_router.dart';
import 'package:do_it_flutter_v2/widgets/custom_app_bar.dart';
import 'package:do_it_flutter_v2/widgets/custom_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/tasks_list_widget.dart';

class TasksListScreen extends StatelessWidget {
  static String get route => AppRouter.addRoute(
      routeName: "TasksListScreen", screen: TasksListScreen());

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TasksListProvider>(
      create: (context) => TasksListProvider(),
      child: Scaffold(
        appBar: customAppBar(title: "Your Tasks"),
        body: Consumer<TasksListProvider>(
          builder: (context, provider, child) {
            return FutureBuilder<List<Task>?>(
              future: provider.getTasks(context: context),
              builder: (context, AsyncSnapshot<List<Task>?> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return TasksListWidget(tasks: snapshot.data);
                }
                return Center(
                  child: Text("loading..."),
                );
              },
            );
          },
        ),
      ),
    );
  }
}



