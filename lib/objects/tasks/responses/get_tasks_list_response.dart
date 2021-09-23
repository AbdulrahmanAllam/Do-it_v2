import 'dart:convert';

import 'package:do_it_flutter_v2/services/remote/api/base_response.dart';

class GetTasksListResponse implements BaseResponse{

  List<GetTasksListResponseTasks>? tasks;

  @override
  fromJson(String response) {
    tasks = List<GetTasksListResponseTasks>.from(json.decode(response).map((x) => GetTasksListResponseTasks.fromJson(x)));
  }

  
  String toJson() {
    String data = "";
    data = json.encode(List<dynamic>.from(tasks!.map((x) => x.toJson())));
    return data;
  }


}

class GetTasksListResponseTasks {
  int? id;
  String? title;
  bool? done;
  String? description;
  String? userId;
  GetTasksListResponseCategory? category;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;

  GetTasksListResponseTasks(
      {this.id,
      this.title,
      this.done,
      this.description,
      this.userId,
      this.category,
      this.publishedAt,
      this.createdAt,
      this.updatedAt});

  GetTasksListResponseTasks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    done = json['done'];
    description = json['description'];
    userId = json['user_id'];
    category = GetTasksListResponseCategory.fromJson(json['category']);
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
      data['category'] = this.category?.toJson();
    
    data['published_at'] = this.publishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class GetTasksListResponseCategory {
  int? id;
  String? name;
  String? color;
  String? userId;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;

  GetTasksListResponseCategory(
      {this.id,
      this.name,
      this.color,
      this.userId,
      this.publishedAt,
      this.createdAt,
      this.updatedAt});

  GetTasksListResponseCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
    userId = json['user_id'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['color'] = this.color;
    data['user_id'] = this.userId;
    data['published_at'] = this.publishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
