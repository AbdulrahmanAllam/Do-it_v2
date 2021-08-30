import 'package:do_it_flutter_v2/services/remote/api/http_services.dart';
import 'package:flutter/material.dart';

import '../task/task.dart';
import 'responses/get_tasks_list_response.dart';

class Tasks{
  List<Task>? _task;

  Future<void> getTasks({required BuildContext context}) async {
    
   await HttpServices().get<GetTasksListResponse>(endpoint: "tasks", requestName: "Get All Tasks", responseModel: GetTasksListResponse(), context: context);
  }
}