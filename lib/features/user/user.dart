import 'package:do_it_flutter_v2/features/user/responses/sign_in_response.dart';
import 'package:do_it_flutter_v2/services/local/shared_preferences/shared_preferences_services.dart';
import 'package:do_it_flutter_v2/services/remote/api/http_services.dart';
import 'package:do_it_flutter_v2/utils/constants/constants_key.dart';
import 'package:flutter/material.dart';

class User {
  static final HttpServices _httpServices = HttpServices();

  User._();

  static final User singleton = User._();


  String? _name;
  late String _email;
  late String _password;

  String? validateEmail(String email) {
    bool emailValid = RegExp(r"[a-zA-Z0-9_-]+@[a-z]+\.[a-z]").hasMatch(email);
    if (email.isEmpty) {
      return "email required";
    } else if (!emailValid || email.contains(" ")) {
      return "email not valid";
    }else{
      _email = email;
    }
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return "this field is required";
    } else if (password.length < 6) {
      return "password length must be 6 or more";
    }else{
      _password = password;
    }
  }

  Future<void> signIn(
      {required BuildContext context,
      Function(SignInResponse)? onSuccess,
      Function(int)? onError,
      Function()? onConnectionError}) async {
    Map<String, String> body = {
      "identifier": "$_email",
      "password": "$_password",
    };
    await _httpServices.post<SignInResponse>(
      endpoint: "auth/local",
      requestName: "Sign In",
      responseModel: SignInResponse(),
      context: context,
      body: body,
      onSuccess: onSuccess,
      onError: onError,
      onConnectionError: onConnectionError,
      // onSuccess: (data){
      //   SharedPreferencesServices.setInt(key: ConstantsKey.userId, value: data.user?.id ?? 0);
      //   SharedPreferencesServices.setString(key: ConstantsKey.jwt, value: data.jwt ?? "");
      // }
    );
  }

  signUp() {}

  // set name(String v) => _name = v;
  // set email(String v) => _email = v;
  // set password(String v) => _password = v;
}
