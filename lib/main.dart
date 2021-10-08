import 'package:do_it_flutter_v2/screens/splash_screen.dart';
import 'package:do_it_flutter_v2/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import 'objects/tasks/view/tasks_list/tasks_list_provider.dart';
import 'utils/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TasksListProvider>(
      create: (_) => TasksListProvider(),
      child: OverlaySupport.global(
        child: MaterialApp(
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
      ),
    );
  }
}
