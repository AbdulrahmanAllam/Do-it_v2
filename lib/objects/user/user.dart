import 'package:do_it_flutter_v2/objects/user/responses/sign_in_response.dart';
import 'package:do_it_flutter_v2/objects/user/responses/sign_up_response.dart';
import 'package:do_it_flutter_v2/objects/user/ui/sign_in/sign_in_screen.dart';
import 'package:do_it_flutter_v2/services/local/shared_preferences/shared_preferences_keys.dart';
import 'package:do_it_flutter_v2/services/local/shared_preferences/shared_preferences_services.dart';
import 'package:do_it_flutter_v2/services/remote/api/http_services.dart';
import 'package:do_it_flutter_v2/utils/log.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class User {
  final HttpServices _httpServices = HttpServices.singleton;

  static int _id = 0;
  static String _jwt = "";
  late String _name;
  late String _email;
  late String _password;


  static void save({required int id, required String jwt}) async {
    _id = id;
    _jwt = jwt;
    await SharedPreferencesServices.singleton.setInt(
        key: SharedPreferencesKeys.userId, value: id);
    await SharedPreferencesServices.singleton.setString(
        key: SharedPreferencesKeys.jwt, value: jwt);
  }

  // check if user is sorted
  static void check({Function()? found, Function()? notFound}) async {
    int? id = await SharedPreferencesServices.singleton.getInt(
        key: SharedPreferencesKeys.userId);
    String? jwt = await SharedPreferencesServices.singleton.getString(
        key: SharedPreferencesKeys.jwt);

    if (id == null && jwt == null) {
      if (notFound != null) notFound();
    } else {
      _id = id!;
      _jwt = jwt!;
      if (found != null) found();
    }
  }

  Future<void> signIn(
      {
      Function(SignInResponse)? onSuccess,
      Function(int)? onError,
      Function()? onConnectionError}) async {
    Map<String, String> body = {
      "identifier": "$_email",
      "password": "$_password",
    };
    if (_email.isEmpty || _password.isEmpty) {
      Log.error("email and password required");
    } else {
      await _httpServices.post<SignInResponse>(
        endpoint: "auth/local",
        requestName: "Sign In",
        responseModel: SignInResponse(),
        body: body,
        onSuccess: onSuccess,
        onError: onError,
        onConnectionError: onConnectionError,
      );
    }
  }

  Future<void> signUp(
      {
      Function(SignUpResponse)? onSuccess,
      Function(int)? onError,
      Function()? onConnectionError}) async {
    Map<String, String> body = {
      "username": "$_name",
      "email": "$_email",
      "password": "$_password",
    };
    if (_name.isEmpty || _email.isEmpty || _password.isEmpty) {
      Log.error("name , password and email are required");
    } else {
      await _httpServices.post<SignUpResponse>(
        endpoint: "auth/local/register",
        requestName: "Sign Up",
        responseModel: SignUpResponse(),
        body: body,
        onSuccess: onSuccess,
        onError: onError,
        onConnectionError: onConnectionError,
      );
    }
  }

  static void logOut() {
    SharedPreferencesServices.singleton.clear().then((value) => Navigator.pushReplacementNamed(MyApp.navigatorKey.currentState!.context, SignInScreen.route));
  }

  String? setEmail(String email) {
    bool emailValid = RegExp(r"[a-zA-Z0-9_-]+@[a-z]+\.[a-z]").hasMatch(email);
    if (email.isEmpty) {
      return "this field is required";
    } else if (!emailValid || email.contains(" ")) {
      return "email not valid";
    }
    else{
      this._email = email;
    }
  }

  String? setPassword(String password) {
    if (password.isEmpty) {
      return "this field is required";
    } else if (password.length < 6) {
      return "password length must be 6 or more";
    }else{
      this._password = password;
    }
  }

  String? setName(String name) {
    if (name.isEmpty) {
      return "this field is required";
    } else if (name.length < 1) {
      return "name can't less than two letters";
    }
    else{
      this._name = name;
    }
  }

  static int get id => _id;
  static String get jwt => _jwt;

}
