import 'package:do_it_flutter_v2/objects/task/ui/add_task/widgets/title_text_form_field.dart';
import 'package:do_it_flutter_v2/utils/app_height.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../add_task_proivder.dart';
import 'add_task_button.dart';
import 'description_text_form_field.dart';

class AddTaskBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddTaskProvider>(context,  listen: false);
    return Form(
      key: provider.formKey,
      child: Column(
        children: [
          TitleTextFormField(),
          AppHeight.h30,
          DescriptionTextFormField(),
          AppHeight.h30,
          Text("to select category"),
          AppHeight.expanded,
          AddTaskButton(),
        ],
      ),
    );
  }
}
