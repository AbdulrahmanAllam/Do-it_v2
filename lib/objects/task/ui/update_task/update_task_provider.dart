import 'package:flutter/cupertino.dart';

import '../../task.dart';

class UpdateTaskProvider extends ChangeNotifier{
  late Task oldTask;
  late Task currentTask;

  update(){
    if(oldTask.equal(currentTask)){
      print("");
    }
  }
}