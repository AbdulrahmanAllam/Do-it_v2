import 'package:flutter/material.dart';

import '../main.dart';

void customSnackBar({String? text}) {
  MyApp.rootScaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(
      content: Text("$text"),
    ),
  );
}
