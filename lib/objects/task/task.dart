
import 'package:do_it_flutter_v2/objects/category/category.dart';
import 'package:do_it_flutter_v2/objects/task/response/update_task_response.dart';
import 'package:do_it_flutter_v2/services/remote/api/http_services.dart';

class Task {
HttpServices _httpServices = HttpServices.singleton;

  late int _id;
  late String _title;
  late bool _done;
  Category? _category;

  Task(
      {required int id,
      required String title,
      required bool done,
      Category? category})
      : _title = title,
        _done = done,
        _id = id,
        _category = category;

  update() {}

  Future<void> check() async {
    bool status = !this._done;
    Map<String, String> body = {"done": "$status"};
  print("kkkkk");
    await _httpServices.put<UpdateTaskResponse>(
        endpoint: "tasks/${this._id}",
        requestName: "Check Task",
        responseModel: UpdateTaskResponse(),
        body: body);
  }

  delete() {}

  String get title => _title;
  set title(String v) => _title = v;

  bool get done => _done;
  set done(bool v) => _done = v;

  int get id => _id;
  set id(int v) => _id = v;

  Category? get category => _category;
  set category(Category? v) => _category = v;
}
