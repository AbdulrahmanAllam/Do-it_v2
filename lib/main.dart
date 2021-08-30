import 'package:flutter/material.dart';
import 'features/task/task.dart';
import 'features/tasks/tasks.dart';
import 'features/user/ui/sign_in/sign_in_screen.dart';
import 'utils/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: SignInScreen(),
    );
  }
}

class Dark extends StatefulWidget {

  

  @override
  _DarkState createState() => _DarkState();
}



class _DarkState extends State<Dark> {

  @override
  void initState() {
    Tasks().getTasks(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text("Hi");
  }
}