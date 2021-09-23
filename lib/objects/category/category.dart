
import 'package:do_it_flutter_v2/objects/tasks/tasks.dart';

class Category {
  late String _name;
  late int _id;
  late int _color;
  Tasks? _tasks;

  Category(
      {required int id, required int color, required String name, Tasks? tasks})
      : _color = color,
        _id = id,
        _name = name,
        _tasks = tasks;

  int get color => _color;
  set color(int v) => _color = v;

  int get id => _id;
  set id(int v) => _id = v;

  String get name => _name;
  set name(String v) => _name = v;

  Tasks? get tasks => _tasks;
}
