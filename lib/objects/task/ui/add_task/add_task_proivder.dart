import 'package:do_it_flutter_v2/objects/task/response/add_task_response.dart';
import 'package:do_it_flutter_v2/objects/task/ui/task_item/widgets/checked_task.dart';
import 'package:do_it_flutter_v2/objects/tasks/tasks.dart';
import 'package:flutter/material.dart';

import '../../task.dart';

class AddTaskProvider extends ChangeNotifier{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Task _task = Task(title: "fake",done: true,id: 0, description: "");

  String? validateTitle({required String title}) => _task.setTitle(title);
  String? validateDescription({required String description}) => _task.setDescription(description);

  Future<void> add({Function(AddTaskResponse)? onSuccess}) async {
    if(_formKey.currentState!.validate()) {

      await _task.add(onSuccess: onSuccess);
    }
  }

  GlobalKey<FormState> get formKey => _formKey;

  set task(Task? v) {
    if(v == null){
      _task = Task(id: 0, done: false,title: "fake",description: "");
    }else{
      _task = v;
    }
  }
}