import 'package:do_it_flutter_v2/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {

  String? Function(String?)? validator;
  void Function(String?)? onSaved;

  PasswordField({this.validator, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "password",
      icon: Icons.lock,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
