import 'package:do_it_flutter_v2/screens/splash_screen.dart';
import 'package:do_it_flutter_v2/utils/app_router.dart';
import 'package:do_it_flutter_v2/utils/log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'objects/tasks/ui/tasks_list/tasks_list_provider.dart';
import 'utils/app_colors.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  //TODO: search about ( GlobalKey - ScaffoldMessengerState - NavigatorState )
  //TODO: make custom navigator and try remove [ChangeNotifierProvider<TasksListProvider>]

  @override
  Widget build(BuildContext context) {
    Log.information(Colors.amber.value);
    return ChangeNotifierProvider<TasksListProvider>(
      create: (_) => TasksListProvider(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaffoldMessengerKey,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: AppColors.black),
              color: AppColors.white,
              elevation: 0,
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: AppColors.black,
              elevation: 0.0,
            ),
            scaffoldBackgroundColor: AppColors.white),
        initialRoute: SplashScreen.route,
        routes: AppRouter.routes,
      ),
    );
  }
}
