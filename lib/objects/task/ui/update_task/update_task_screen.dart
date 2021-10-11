import 'package:do_it_flutter_v2/utils/app_router.dart';
import 'package:do_it_flutter_v2/widgets/custom_state.dart';
import 'package:flutter/material.dart';

class UpdateTaskScreen extends StatefulWidget {

  static String get route => AppRouter.addRoute(screen: UpdateTaskScreen());

  @override
  _UpdateTaskScreenState createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends CustomState<UpdateTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  String get routeName => widget.toString();
}
