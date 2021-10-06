import 'package:do_it_flutter_v2/objects/task/ui/add_task/add_task_proivder.dart';
import 'package:do_it_flutter_v2/objects/tasks/view/tasks_list/tasks_list_provider.dart';
import 'package:do_it_flutter_v2/widgets/cutom_material_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddTaskProvider>(context, listen: false);
    final tasksProvider = Provider.of<TasksListProvider>(context,);
    return CustomMaterialButton(
      onPressed: () async {
        await provider.add(
            onSuccess: (data){
              tasksProvider.refresh();
              Navigator.pop(context);
            }
        );
      },
      text: "Add",
    );
  }
}
