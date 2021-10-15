import 'package:do_it_flutter_v2/objects/task/ui/update_task/update_task_provider.dart';
import 'package:do_it_flutter_v2/objects/task/ui/update_task/widgets/update_task_body.dart';
import 'package:do_it_flutter_v2/objects/task/ui/widgets/description_text_form_field.dart';
import 'package:do_it_flutter_v2/objects/task/ui/widgets/title_text_form_field.dart';
import 'package:do_it_flutter_v2/objects/tasks/ui/tasks_list/tasks_list_provider.dart';
import 'package:do_it_flutter_v2/utils/app_height.dart';
import 'package:do_it_flutter_v2/utils/app_router.dart';
import 'package:do_it_flutter_v2/widgets/custom_app_bar.dart';
import 'package:do_it_flutter_v2/widgets/custom_state.dart';
import 'package:do_it_flutter_v2/widgets/cutom_material_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateTaskScreen extends StatefulWidget {

  static String get route => AppRouter.addRoute(screen: UpdateTaskScreen());

  @override
  _UpdateTaskScreenState createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends CustomState<UpdateTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final tasksProvider =
    Provider.of<TasksListProvider>(context, listen: false);
    return
        ChangeNotifierProvider<UpdateTaskProvider>(
            create: (_)=> UpdateTaskProvider(task: tasksProvider.selectedTask),
          child:  Scaffold(
            appBar: customAppBar(title: "Update Task"),
            body:
            // UpdateTaskBody(),

            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    MediaQuery.of(context).padding.top,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: UpdateTaskBody(),
                ),
              ),
            ),
          ),

        );


    //   ChangeNotifierProxyProvider<TasksListProvider, UpdateTaskProvider>(
    //   create: (_) => UpdateTaskProvider(),
    //   update: (_, tasksListProvider, taskItemProvider) => UpdateTaskProvider(task: tasksProvider.selectedTask),
    //   child: Scaffold(
    //     appBar: customAppBar(title: "Update Task"),
    //     body:
    //     // UpdateTaskBody(),
    //
    //     SingleChildScrollView(
    //       child: Container(
    //         height: MediaQuery.of(context).size.height -
    //             AppBar().preferredSize.height -
    //             MediaQuery.of(context).padding.top,
    //         child: Padding(
    //           padding: EdgeInsets.all(20.0),
    //           child: UpdateTaskBody(),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  @override
  String get routeName => widget.toString();
}
