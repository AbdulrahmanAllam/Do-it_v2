import 'package:do_it_flutter_v2/objects/tasks/view/tasks_list/tasks_list_provider.dart';
import 'package:do_it_flutter_v2/utils/app_height.dart';
import 'package:do_it_flutter_v2/widgets/custom_text_form_field.dart';
import 'package:do_it_flutter_v2/widgets/cutom_material_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../add_task_proivder.dart';

class AddTaskBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddTaskProvider>(context, listen: false);
    final tasksProvider =
        Provider.of<TasksListProvider>(context, listen: false);
    return Form(
      key: provider.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: "Title",
            maxLength: 20,
            maxLines: 1,
            validator: (value) => provider.validateTitle(title: value ?? ""),
          ),
          AppHeight.h30,
          CustomTextFormField(
            hintText: "Description",
            maxLines: 5,
            validator: (v) =>
                provider.validateDescription(description: v ?? ""),
          ),
          AppHeight.h30,
          //TODO: select category from drop down
          Text("to select category"),
          AppHeight.expanded,
          CustomMaterialButton(
            onPressed: () async {
              await provider.add(onSuccess: (data) {
                tasksProvider.refresh();
                Navigator.pop(context);
              });
            },
            text: "Add",
          ),
        ],
      ),
    );
  }
}
