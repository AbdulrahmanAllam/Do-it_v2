import 'package:do_it_flutter_v2/features/tasks/ui/tasks_list/tasks_list_screen.dart';
import 'package:do_it_flutter_v2/features/user/user.dart';
import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final User _user = User.singleton;

  String? validatePassword(String password) => _user.validatePassword(password);
  String? validateEmail(String email) => _user.validateEmail(email);

  Future<void> signIn({required BuildContext context}) async {
    if (_formKey.currentState!.validate()) {
      await _user.signIn(
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
