import 'package:do_it_flutter_v2/utils/log.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {

  static String addRoute({required Widget screen}){
    routes[screen.toString()] = (context) => screen;
    Log.information(routes);
    return screen.toString();
  }

  static void removeRoute({required String routeName}){
    routes.remove(routeName);
  }

  static Map<String, WidgetBuilder> routes = {};  
}
