import 'package:do_it_flutter_v2/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  String? Function(String?)? validator;
  void Function(String?)? onSaved;

  EmailField({this.onSaved, this.validator});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "email",
      icon: Icons.email,
      validator: validator,
      onSaved: onSaved,
      
    );
  }
}
