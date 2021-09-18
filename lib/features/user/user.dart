import 'package:do_it_flutter_v2/features/user/responses/sign_in_response.dart';
import 'package:do_it_flutter_v2/features/user/responses/sign_up_response.dart';
import 'package:do_it_flutter_v2/services/local/shared_preferences/shared_preferences_keys.dart';
import 'package:do_it_flutter_v2/services/local/shared_preferences/shared_preferences_services.dart';
import 'package:do_it_flutter_v2/services/remote/api/http_services.dart';
import 'package:do_it_flutter_v2/utils/log.dart';
import 'package:flutter/material.dart';

class User {
  final HttpServices _httpServices = HttpServices.singleton;
  final SharedPreferencesServices _sharedPreferencesServices =
      SharedPreferencesServices.singleton;

  User._();

  static final User singleton = User._();

  int _id = 0;
  late String _name;
  late String _email;
  late String _password;

  String? validateName(String name) {
    if (name.isEmpty) {
      return "this field is required";
    } else if (name.length < 1) {
      return "name can't less than two letters";
    }
  }

  String? validateEmail(String email) {
    bool emailValid = RegExp(r"[a-zA-Z0-9_-]+@[a-z]+\.[a-z]").hasMatch(email);
    if (email.isEmpty) {
      return "this field is required";
    } else if (!emailValid || email.contains(" ")) {
      return "email not valid";
    } else {
      _email = email;
    }
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return "this field is required";
    } else if (password.length < 6) {
      return "password length must be 6 or more";
    } else {
      _password = password;
    }
  }

  save({required int id, required String jwt}) async {
    _id = id;
    await _sharedPreferencesServices.setInt(
        key: SharedPreferencesKeys.userId, value: id);
    await _sharedPreferencesServices.setString(
        key: SharedPreferencesKeys.jwt, value: jwt);
  }

  // check if user is sorted
  check({Function()? found, Function()? notFound}) async {
    int? id = await _sharedPreferencesServices.getInt(key: SharedPreferencesKeys.userId);
    String? jwt = await _sharedPreferencesServices.getString(key: SharedPreferencesKeys.jwt);

    if (id == null && jwt == null) {
      if(notFound != null) notFound();
    } else {
      _id = id!;
      if(found != null) found();
    }
  }

  Future<void> signIn(
      {Function(SignInResponse)? onSuccess,
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
      {Function(SignUpResponse)? onSuccess,
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

  logOut(){}

  int get id => _id;
}
