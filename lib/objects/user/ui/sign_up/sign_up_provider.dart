import 'package:do_it_flutter_v2/objects/tasks/view/tasks_list/tasks_list_screen.dart';
import 'package:flutter/material.dart';

import '../../user.dart';

class SignUpProvider extends ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final User _user = User();

  String? validateEmail(String email) => _user.setEmail(email);

  String? validatePassword(String password) => _user.setPassword(password);

  String? validateName(String name) => _user.setName(name);



  Future<void> signUp({required BuildContext context}) async {
    if (_formKey.currentState!.validate()) {
      await _user.signUp(
        onSuccess: (data) async {
          _user.save(id: data.user?.id??0, jwt: data.jwt??"");
          Navigator.pushReplacementNamed(context, TasksListScreen.route);
        },
      );
    }
  }

  //===================getters and setters===============
  GlobalKey<FormState> get formKey => _formKey;

}
