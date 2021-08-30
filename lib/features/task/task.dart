import 'package:do_it_flutter_v2/services/remote/api/http_services.dart';
import 'package:flutter/material.dart';

class Task{
  late int _id;
  late String _title;
  late bool _done;

  Task({required int id, required String title, required bool done})
    :_title = title, _done = done, _id = id;

  
  add(){}
  check(){}

  String get title => _title;
  set title(String v) => _title = v;

  bool get done => _done;
  set done(bool v) => _done = v;

  int get id => _id;
  set id(int v) => _id = v;
}