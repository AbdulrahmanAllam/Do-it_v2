import 'package:do_it_flutter_v2/features/tasks/ui/tasks_list/tasks_list_screen.dart';
import 'package:do_it_flutter_v2/features/user/ui/sign_up/sign_up_screen.dart';
import 'package:do_it_flutter_v2/features/user/ui/user_widgets/email_field.dart';
import 'package:do_it_flutter_v2/features/user/ui/user_widgets/logo.dart';
import 'package:do_it_flutter_v2/features/user/ui/user_widgets/or_divider.dart';
import 'package:do_it_flutter_v2/features/user/ui/user_widgets/password_field.dart';
import 'package:do_it_flutter_v2/features/user/ui/user_widgets/sign_in_button.dart';
import 'package:do_it_flutter_v2/features/user/ui/user_widgets/sign_up_button.dart';
import 'package:do_it_flutter_v2/utils/app_height.dart';
import 'package:do_it_flutter_v2/utils/app_router.dart';
import 'package:do_it_flutter_v2/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'sign_in_provider.dart';

class SignInScreen extends StatelessWidget {

  static String get route => AppRouter.addRoute(routeName: "SignInScreen", screen: SignInScreen());

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInProvider>(
      create: (context) => SignInProvider(),
      child: Scaffold(
        appBar: customAppBar(title: "Sign In", centerTitle: true),
        body: SingleChildScrollView(
          child: Consumer<SignInProvider>(builder: (context, provider, child) {
            return Form(
              key: provider.formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AppHeight.h50,
                    Logo(),
                    AppHeight.h50,
                    EmailField(
                      validator: (value) =>
                          provider.validateEmail(value ?? ""),
                    ),
                    AppHeight.h20,
                    PasswordField(
                      validator: (value) =>
                          provider.validatePassword(value ?? ""),
                    ),
                    AppHeight.h50,
                    SignInButton(onPressed: () {
                      provider.signIn(context: context);
                    }),
                    OrDivider(),
                    SignUpButton(onPressed: () {
                      Navigator.pushNamed(context, SignUpScreen.route);
                    }),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
