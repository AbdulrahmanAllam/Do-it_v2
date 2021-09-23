import 'package:flutter/material.dart';

import '../../task.dart';

class TaskItemProvider extends ChangeNotifier{
  late Task _task;

  Future<void> check() async {
    await _task.check();
  }

  String get title => _task.title;
  int get color => _task.category?.color??0;
  bool get done => _task.done;
}