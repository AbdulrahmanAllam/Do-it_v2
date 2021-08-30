import 'package:do_it_flutter_v2/features/user/user.dart';
import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final User _user = User.singleton;
  late String _email;
  late String _password;

  String? validatePassword(String password) => _user.validatePassword(password);
  String? validateEmail(String email) => _user.validateEmail(email);

  Future<void> signIn({required BuildContext context}) async {
    if (_formKey.currentState!.validate()) {
      // _formKey.currentState?.save();
      await _user.signIn(context: context);
    }
  }

  //===================getters and setters===============
  GlobalKey<FormState> get formKey => _formKey;
  // set email(String v) => _email = v;
  // set password(String v) => _password = v;
}
