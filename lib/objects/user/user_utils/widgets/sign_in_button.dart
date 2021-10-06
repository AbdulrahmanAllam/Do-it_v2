import 'package:do_it_flutter_v2/widgets/cutom_material_button.dart';
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  late void Function()? onPressed;

  SignInButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomMaterialButton(
      onPressed: onPressed,
      text: "Sign In",
    );
  }
}
