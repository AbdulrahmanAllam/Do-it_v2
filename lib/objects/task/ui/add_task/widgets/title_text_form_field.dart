import 'package:do_it_flutter_v2/objects/task/ui/add_task/add_task_proivder.dart';
import 'package:do_it_flutter_v2/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleTextFormField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddTaskProvider>(context, listen: false);
    return CustomTextFormField(
      hintText: "Title",
      maxLength: 20,
      validator: (value) => provider.validateTitle(title: value??""),
    );
  }
}
