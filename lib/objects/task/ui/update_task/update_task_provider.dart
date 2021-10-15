import 'package:do_it_flutter_v2/objects/task/response/update_task_response.dart';
import 'package:do_it_flutter_v2/utils/log.dart';
import 'package:do_it_flutter_v2/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';

import '../../task.dart';

class UpdateTaskProvider extends ChangeNotifier{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Task _oldTask;
  Task _currentTask = Task(id: 0, title: "title", done: false, description: "description");

  UpdateTaskProvider({Task? task}){
    _oldTask = task??Task(id: 0, title: "title", done: false, description: "description");
    _currentTask.setAll(_oldTask);
  }

  validateTitle({required String title}) => _currentTask.setTitle(title);
  validateDescription({required String description}) => _currentTask.setDescription(description);

  update({Function(UpdateTaskResponse)? onSuccess}) {
    if (_formKey.currentState!.validate()) {
    if (_currentTask.equal(_oldTask)) {
      customSnackBar(text: "you don't change any thing");
    } else {
      _currentTask.update(
          onSuccess: onSuccess
      );
    }
  }
  }

  GlobalKey<FormState> get formKey => _formKey;

  String get initTitle => _oldTask.title;
  String get initDescription {
    Log.information("${_oldTask.title}\n${_oldTask.description}");
    return _oldTask.description;
  }
}