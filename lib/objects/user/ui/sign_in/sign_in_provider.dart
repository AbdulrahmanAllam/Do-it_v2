import 'package:do_it_flutter_v2/objects/tasks/ui/tasks_list/tasks_list_screen.dart';
import 'package:do_it_flutter_v2/utils/app_navigator.dart';
import 'package:flutter/material.dart';

import '../../user.dart';

class SignInProvider extends ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final User _user = User();

  String? validateEmail(String email) => _user.setEmail(email);

  String? validatePassword(String password) => _user.setPassword(password);

  Future<void> signIn({required BuildContext context}) async {
    if (_formKey.currentState!.validate()) {
      await _user.signIn(
        onSuccess: (data) async {
          AppNavigator.pushReplacement(routeName: TasksListScreen.route);
        },
      );
    }
  }

  //===================getters and setters===============
  GlobalKey<FormState> get formKey => _formKey;
}
