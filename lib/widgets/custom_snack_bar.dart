import 'package:flutter/material.dart';

class CustomSnacBar extends StatelessWidget {

  late String _message;

  CustomSnacBar({required String message}):_message = message;

  @override
  Widget build(BuildContext context) {
    return SnackBar(content: 
      Text("$_message"),
    );
  }
}