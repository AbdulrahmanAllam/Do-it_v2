import 'dart:async';
import 'package:do_it_flutter_v2/features/tasks/ui/tasks_list/tasks_list_screen.dart';
import 'package:do_it_flutter_v2/features/user/ui/sign_in/sign_in_screen.dart';
import 'package:do_it_flutter_v2/features/user/user.dart';
import 'package:do_it_flutter_v2/services/local/shared_preferences/shared_preferences_keys.dart';
import 'package:do_it_flutter_v2/services/local/shared_preferences/shared_preferences_services.dart';
import 'package:do_it_flutter_v2/utils/app_images.dart';
import 'package:do_it_flutter_v2/utils/app_router.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static String get route =>
      AppRouter.addRoute(routeName: "SplashScreen", screen: SplashScreen());

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferencesServices _preferencesServices;

  @override
  void initState() {
    _preferencesServices = SharedPreferencesServices.singleton;
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
    User.singleton.check(
      found: (){
        Navigator.pushReplacementNamed(context, TasksListScreen.route);
      },
      notFound: (){
        Navigator.pushReplacementNamed(context, SignInScreen.route);
      }
    );
  }
}
