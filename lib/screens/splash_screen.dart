import 'dart:async';
import 'package:do_it_flutter_v2/objects/tasks/ui/tasks_list/tasks_list_screen.dart';
import 'package:do_it_flutter_v2/objects/user/ui/sign_in/sign_in_screen.dart';
import 'package:do_it_flutter_v2/objects/user/user.dart';
import 'package:do_it_flutter_v2/utils/app_images.dart';
import 'package:do_it_flutter_v2/utils/app_router.dart';
import 'package:do_it_flutter_v2/widgets/custom_state.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static String get toText => "SplashScreen";
  static String get route =>
      AppRouter.addRoute(routeName: SplashScreen.toText, screen: SplashScreen());

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends CustomState<SplashScreen> {

  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      _goTo,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 140.0),
        child: Center(
          child: Image.asset(AppImages.getPngImage("logo")),
        ),
      ),
    );
  }

  _goTo() async {
    User.check(
      found: (){
        Navigator.pushReplacementNamed(context, TasksListScreen.route);
      },
      notFound: (){
        Navigator.pushReplacementNamed(context, SignInScreen.route);
      }
    );
  }

  @override
  String get routeName => widget.toString();
}