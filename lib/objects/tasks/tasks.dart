import 'package:do_it_flutter_v2/objects/task/response/add_task_response.dart';
import 'package:do_it_flutter_v2/objects/user/user.dart';
import 'package:do_it_flutter_v2/services/remote/api/http_services.dart';
import 'package:flutter/material.dart';

import '../task/task.dart';
import 'responses/get_tasks_list_response.dart';

class Tasks {
  HttpServices _httpServices = HttpServices.singleton;

  List<Task>? _tasks = [];



  Future<List<Task>?> getTasks(
      {Function(int)? onError, Function()? onConnectionError}) async {
    await _httpServices.get<GetTasksListResponse>(
      endpoint: "tasks",
      requestName: "Get All Tasks",
      responseModel: GetTasksListResponse(),
      onSuccess: (data) {
        _tasks?.clear();
        data.tasks?.forEach((element) {
          if (int.parse(element.userId ?? "0") == User.id) {
            _tasks?.add(Task(
              description: element.description??"",
              id: element.id ?? 0,
              title: element.title ?? "",
              done: element.done ?? false,
            ));
          }
        });
      },
      onError: onError,
      onConnectionError: onConnectionError,
    );
    return _tasks;
  }
}
