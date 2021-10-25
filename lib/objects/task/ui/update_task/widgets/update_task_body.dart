import 'package:do_it_flutter_v2/objects/task/ui/widgets/description_text_form_field.dart';
import 'package:do_it_flutter_v2/objects/task/ui/widgets/title_text_form_field.dart';
import 'package:do_it_flutter_v2/objects/tasks/ui/tasks_list/tasks_list_provider.dart';
import 'package:do_it_flutter_v2/utils/app_height.dart';
import 'package:do_it_flutter_v2/utils/app_navigator.dart';
import 'package:do_it_flutter_v2/widgets/cutom_material_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../update_task_provider.dart';

class UpdateTaskBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UpdateTaskProvider>(context, listen:false);
    final tasksProvider =
    Provider.of<TasksListProvider>(context, listen: false);
    return Form(
      key: provider.formKey,
      child: Column(
        children: [
          TitleTextFormField(
            initialValue: provider.initTitle,
            validator: (v) => provider.validateTitle(title: v??""),
          ),
          AppHeight.h30,
          DescriptionTextFormFiled(
            initialValue: provider.initDescription,
            validator: (v) => provider.validateDescription(description: v??""),
          ),
          AppHeight.h30,
          //TODO: select category from drop down
          Text("to select category"),
          AppHeight.expanded,
          CustomMaterialButton(
            onPressed: () async {
              await provider.update(
                  onSuccess: (data) {
                tasksProvider.refresh();
                AppNavigator.pop();
              });
            },
            text: "Update",
          ),
        ],
      ),
    );
  }
}
