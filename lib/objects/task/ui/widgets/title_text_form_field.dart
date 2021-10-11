import 'package:do_it_flutter_v2/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class TitleTextFormField extends StatelessWidget {

  String Function(String?)? validator;

  TitleTextFormField({this.validator});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "Title",
      maxLength: 20,
      maxLines: 1,
      validator: validator,
    );
  }
}
