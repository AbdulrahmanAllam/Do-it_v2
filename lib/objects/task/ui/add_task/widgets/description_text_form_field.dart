import 'package:do_it_flutter_v2/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../add_task_proivder.dart';

class DescriptionTextFormField extends StatelessWidget {
  const DescriptionTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddTaskProvider>(context, listen: false);
    return CustomTextFormField(
      hintText: "Description",
      maxLines: 5,
      validator: (v) => provider.validateDescription(description: v??""),
    );
  }
}
