import 'package:do_it_flutter_v2/objects/task/ui/add_task/add_task_proivder.dart';
import 'package:do_it_flutter_v2/objects/task/ui/add_task/widgets/add_task_body.dart';
import 'package:do_it_flutter_v2/objects/tasks/ui/tasks_list/tasks_list_provider.dart';
import 'package:do_it_flutter_v2/utils/app_height.dart';
import 'package:do_it_flutter_v2/utils/app_router.dart';
import 'package:do_it_flutter_v2/widgets/custom_app_bar.dart';
import 'package:do_it_flutter_v2/widgets/custom_state.dart';
import 'package:do_it_flutter_v2/widgets/custom_text_form_field.dart';
import 'package:do_it_flutter_v2/widgets/cutom_material_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AddTaskScreen extends StatefulWidget {
  static String route =
      AppRouter.addRoute(screen: AddTaskScreen());

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends CustomState<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddTaskProvider>(
      create: (context) => AddTaskProvider(),
      child: Scaffold(
        appBar: customAppBar(title: "Add New Task"),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height -
                MediaQuery.of(context).padding.top,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: AddTaskBody(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  String get routeName => widget.toString();
}
