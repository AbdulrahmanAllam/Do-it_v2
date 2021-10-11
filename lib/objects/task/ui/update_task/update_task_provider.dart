import 'package:do_it_flutter_v2/objects/task/response/update_task_response.dart';
import 'package:do_it_flutter_v2/widgets/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';

import '../../task.dart';

class UpdateTaskProvider extends ChangeNotifier{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Task _oldTask;
  late Task _currentTask;

  validateTitle({required String title}) => _currentTask.setTitle(title);
  validateDescription({String? description}) => _currentTask.setDescription(description??"");

  update({Function(UpdateTaskResponse)? onSuccess}){
    if(_currentTask.equal(_oldTask)){
      customSnackBar(text: "you don't change any thing");
    }else{
      if(_formKey.currentState!.validate()){
        _currentTask.update(
            onSuccess: onSuccess
        );
      }
    }
  }

  GlobalKey<FormState> get formKey => _formKey;

  String get initTitle => _oldTask.title;
  String get initDescription => _oldTask.description;
}