import 'package:do_it_flutter_v2/utils/log.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {

  static String addRoute({required String routeName, required Widget screen}){
    routes[routeName] = (context) => screen;
    Log.information(routes);
    return routeName;
  }

  static void removeRoute({required String routeName}){
    routes.remove(routeName);
  }

  static Map<String, WidgetBuilder> routes = {};  
}
