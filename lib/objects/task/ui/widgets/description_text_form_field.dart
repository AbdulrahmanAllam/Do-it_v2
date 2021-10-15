import 'package:do_it_flutter_v2/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class DescriptionTextFormFiled extends StatelessWidget {

  String? Function(String?)? validator;
  String? initialValue;

  DescriptionTextFormFiled({this.validator, this.initialValue});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      initialValue: initialValue,
      hintText: "Description",
      maxLines: 5,
      validator: validator,
    );
  }
}
