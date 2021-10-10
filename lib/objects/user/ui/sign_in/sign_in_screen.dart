import 'package:do_it_flutter_v2/objects/user/ui/sign_up/sign_up_screen.dart';

import 'package:do_it_flutter_v2/objects/user/ui/widgets/email_field.dart';
import 'package:do_it_flutter_v2/objects/user/ui/widgets/logo.dart';
import 'package:do_it_flutter_v2/objects/user/ui/widgets/or_divider.dart';
import 'package:do_it_flutter_v2/objects/user/ui/widgets/password_field.dart';
import 'package:do_it_flutter_v2/objects/user/ui/widgets/sign_in_button.dart';
import 'package:do_it_flutter_v2/objects/user/ui/widgets/sign_up_button.dart';
import 'package:do_it_flutter_v2/utils/app_height.dart';
import 'package:do_it_flutter_v2/utils/app_router.dart';
import 'package:do_it_flutter_v2/widgets/custom_app_bar.dart';
import 'package:do_it_flutter_v2/widgets/custom_snack_bar.dart';
import 'package:do_it_flutter_v2/widgets/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'sign_in_provider.dart';

class SignInScreen extends StatefulWidget {
  static String get toText => "SignInScreen";
  static String get route =>
      AppRouter.addRoute(routeName: toText, screen: SignInScreen());

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends CustomState<SignInScreen> {
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
                      validator: (value) => provider.validateEmail(value ?? ""),
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

  @override
  String get routeName => widget.toString();
}
