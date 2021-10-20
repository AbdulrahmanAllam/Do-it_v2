import 'package:flutter/material.dart';

import '../main.dart';

void customSnackBar({String? text}) {
  MyApp.scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(
      content: Text("$text"),
    ),
  );
}

//TODO: make it as class

// abstract class CustomSnackBar{
//   static void show(){}
//   static Widget _snackBar(){}
// }