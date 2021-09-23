import 'dart:convert';

import 'package:do_it_flutter_v2/services/remote/api/base_response.dart';

class SignInResponse implements BaseResponse {
  String? jwt;
  SignInResponseUser? user;

  SignInResponse({this.jwt, this.user});

  fromJson(String response) {
    Map<String, dynamic> json = jsonDecode(response);
    jwt = json['jwt'];
    user = SignInResponseUser.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jwt'] = this.jwt;
    data['user'] = this.user?.toJson();

    return data;
  }
}

class SignInResponseUser {
  int? id;
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  Null blocked;
  SignInResponseRole? role;
  String? createdAt;
  String? updatedAt;

  SignInResponseUser(
      {this.id,
      this.username,
      this.email,
      this.provider,
      this.confirmed,
      this.blocked,
      this.role,
      this.createdAt,
      this.updatedAt});

  SignInResponseUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    provider = json['provider'];
    confirmed = json['confirmed'];
    blocked = json['blocked'];
    role = SignInResponseRole.fromJson(json['role']);
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['provider'] = this.provider;
    data['confirmed'] = this.confirmed;
    data['blocked'] = this.blocked;
    data['role'] = this.role?.toJson();

    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class SignInResponseRole {
  int? id;
  String? name;
  String? description;
  String? type;

  SignInResponseRole({this.id, this.name, this.description, this.type});

  SignInResponseRole.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['type'] = this.type;
    return data;
  }
}
