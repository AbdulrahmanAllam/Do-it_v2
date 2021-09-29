import 'package:do_it_flutter_v2/objects/category/category.dart';
import 'package:do_it_flutter_v2/objects/user/user.dart';
import 'package:do_it_flutter_v2/services/remote/api/http_services.dart';
import 'package:flutter/material.dart';

import '../task/task.dart';
import 'responses/get_tasks_list_response.dart';

class Tasks {
  HttpServices _httpServices = HttpServices.singleton;

  List<Task>? _task = [];

  add(Task task) {}

  Future<List<Task>?> getTasks(
      {
      Function(int)? onError,
      Function()? onConnectionError}) async {
    await _httpServices.get<GetTasksListResponse>(
      endpoint: "tasks",
      requestName: "Get All Tasks",
      responseModel: GetTasksListResponse(),
      onSuccess: (data) {
        _task?.clear();
        data.tasks?.forEach((element) {
          if (int.parse(element.userId ?? "0") == User.id) {
            _task?.add(Task(
              id: element.id ?? 0,
              title: element.title ?? "",
              done: element.done ?? false,
              category: Category(
                  name: element.category?.name ?? "fake",
                  id: element.category?.id ?? 0,
                  color: int.parse(element.category?.color ?? "0")),
            ));
          }
        });
      },
      onError: onError,
      onConnectionError: onConnectionError,
    );
    return _task;
  }
}
