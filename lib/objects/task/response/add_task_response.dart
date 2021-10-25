import 'dart:convert';

import 'package:do_it_flutter_v2/services/remote/api/base_response.dart';

class AddTaskResponse implements BaseResponse{
  int? id;
  String? title;
  bool? done;
  String? description;
  String? publishedAt;
  String? userId;
  String? createdAt;
  String? updatedAt;

  AddTaskResponse(
      {this.id,
        this.title,
        this.done,
        this.description,
        this.userId,
        // this.category,
        this.publishedAt,
        this.createdAt,
        this.updatedAt});

  fromJson(String data) {
    Map<String, dynamic> json = jsonDecode(data);
    id = json['id'];
    title = json['title'];
    done = json['done'];
    description = json['description'];
    userId = json['user_id'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['done'] = this.done;
    data['description'] = this.description;
    data['user_id'] = this.userId;
    // data['category'] = this.category?.toJson();
    data['published_at'] = this.publishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}