import 'package:flutter/material.dart';

class CustomSnacBar extends StatelessWidget {
//
  late String _message;
//
  CustomSnacBar({required String message}) : _message = message;

  
//
  @override
  Widget build(BuildContext context) {
    _show(context);
    return Container();
  }

  _show(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(_snackBar());
  }

  SnackBar _snackBar() {
    return SnackBar(
      content: Text("$_message"),
    );
  }
}
