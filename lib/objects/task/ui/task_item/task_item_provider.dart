import 'package:do_it_flutter_v2/objects/tasks/view/tasks_list/tasks_list_provider.dart';
import 'package:flutter/material.dart';

import '../../task.dart';

class TaskItemProvider extends ChangeNotifier{
  late Task _task;

  TaskItemProvider({Task? task}){
    if(task == null){
      _task = Task(id: 0, done: false,title: "fake",);
    }else{
      _task = task;
    }
  }

  Future<void> check() async {
    await _task.check();
  }

  Future<void> delete() async {
    await _task.delete();
  }

  String get title => _task.title;
  int get color => _task.category?.color??0;
  bool get done => _task.done;

  set task(Task? v) {
    if(v == null){
      _task = Task(id: 0, done: false,title: "fake",);
    }else{
      _task = v;
    }
  }
}