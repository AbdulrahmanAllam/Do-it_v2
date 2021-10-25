import 'package:do_it_flutter_v2/objects/task/response/add_task_response.dart';
import 'package:do_it_flutter_v2/objects/task/response/delete_task_response.dart';
import 'package:do_it_flutter_v2/objects/task/response/update_task_response.dart';
import 'package:do_it_flutter_v2/objects/user/user.dart';
import 'package:do_it_flutter_v2/services/remote/api/http_services.dart';
import 'package:do_it_flutter_v2/utils/log.dart';

class Task {
  HttpServices _httpServices = HttpServices.singleton;

  late int _id;
  late String _title;
  late bool _done;
  String _description;

  Task(
      {required int id,
      required String title,
      required bool done,
      required String description,})
      : _title = title,
        _done = done,
        _id = id,
        _description = description;

  void getInfo(){
    Log.information("title: ${this._title}, done: ${this._done}, description: ${this._description}");
  }

  void setAll(Task task){
    this.id = task.id;
    this.setTitle(task.title);
    this.done = task.done;
    this.setDescription(task.description);
  }

  bool equal(Task other){
    if(this._title == other.title && this._done == other.done && this._description == other.description){
      getInfo();
      other.getInfo();
      return true;
    }else{
      return false;
    }
  }

  Future<void> update({Function(UpdateTaskResponse)? onSuccess, Function(int)? onError, Function()? onConnectionError}) async {
    Map<String, String> body = {
      "title": this._title,
      "description": this._description,
    };
    await _httpServices.put<UpdateTaskResponse>(
      endpoint: "tasks/${this._id}",
      requestName: "Update Task",
      responseModel: UpdateTaskResponse(),
      body: body,
      onSuccess: onSuccess,
      onError: onError,
      onConnectionError: onConnectionError,
    );
  }

  Future<void> add({Function(AddTaskResponse)? onSuccess, Function(int)? onError, Function()? onConnectionError}) async {
    Map<String, String> body = {
      "title": this._title,
      "description": this._description,
      "user_id": User.id.toString(),
    };
    await _httpServices.post<AddTaskResponse>(
      endpoint: "tasks",
      requestName: "Add Task",
      responseModel: AddTaskResponse(),
      headers: _httpServices.defaultHeader,
      body: body,
      onSuccess: onSuccess,
      onError: onError,
      onConnectionError: onConnectionError,
    );
  }

  Future<void> check() async {
    bool status = !this._done;
    Map<String, String> body = {"done": "$status"};
    await _httpServices.put<UpdateTaskResponse>(
        endpoint: "tasks/${this._id}",
        requestName: "Check Task",
        responseModel: UpdateTaskResponse(),
        body: body);
  }

  Future<void> delete({Function(DeleteTaskResponse)? onSuccess, Function(int)? onError, Function()? onConnectionError}) async {
    print("delelelelleell");
    await _httpServices.delete<DeleteTaskResponse>(
        endpoint: "tasks/${this._id}",
        requestName: "Delete Task",
        responseModel: DeleteTaskResponse(),
        onSuccess: onSuccess,
        onError: onError,
        onConnectionError: onConnectionError,
    );
  }

  String get title => _title;
  String? setTitle(String v) {
    if(v.isEmpty){
      return "this field is required";
    }else{
      _title = v;
    }
  }

  bool get done => _done;
  set done(bool v) => _done = v;

  int get id => _id;
  set id(int v) => _id = v;

  String get description => _description;
  String? setDescription(String v) {
    _description = v;
  }

}
