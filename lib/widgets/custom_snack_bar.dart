// import 'package:flutter/material.dart';
//
// class CustomSnacBar extends StatelessWidget {
// //
//   late String _message;
// //
//   CustomSnacBar({required String message}) : _message = message;
//
//
// //
//   @override
//   Widget build(BuildContext context) {
//     _show(context);
//     return SnackBar(
//       content: Text("$_message"),
//     );
//   }
//
//   _show(BuildContext context) {
//     ScaffoldMessenger.of(context).showSnackBar(_snackBar());
//   }
//
//   SnackBar _snackBar() {
//     return SnackBar(
//       content: Text("$_message"),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

customX(){
  Builder(
    builder: (context){
      return SnackBar(content: Text("no"));
    },
  );
}
