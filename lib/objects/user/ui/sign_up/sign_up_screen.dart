
import 'package:do_it_flutter_v2/objects/user/ui/sign_up/sign_up_provider.dart';
import 'package:do_it_flutter_v2/objects/user/ui/widgets/email_field.dart';
import 'package:do_it_flutter_v2/objects/user/ui/widgets/logo.dart';
import 'package:do_it_flutter_v2/objects/user/ui/widgets/or_divider.dart';
import 'package:do_it_flutter_v2/objects/user/ui/widgets/password_field.dart';
import 'package:do_it_flutter_v2/objects/user/ui/widgets/sign_in_button.dart';
import 'package:do_it_flutter_v2/objects/user/ui/widgets/sign_up_button.dart';
import 'package:do_it_flutter_v2/utils/app_colors.dart';
import 'package:do_it_flutter_v2/utils/app_height.dart';
import 'package:do_it_flutter_v2/utils/app_router.dart';
import 'package:do_it_flutter_v2/widgets/custom_app_bar.dart';
import 'package:do_it_flutter_v2/widgets/custom_state.dart';
import 'package:do_it_flutter_v2/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static String get toText => "SignUpScreen";
  static String get route =>
      AppRouter.addRoute(routeName: SignUpScreen.toText, screen: SignUpScreen());

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends CustomState<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpProvider>(
      create: (context) => SignUpProvider(),
      child: Scaffold(
        appBar: customAppBar(
          title: "Sign Up",
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_outlined,
              color: AppColors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Consumer<SignUpProvider>(builder: (context, provider, child) {
            return Form(
              key: provider.formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    AppHeight.h50,
                    Logo(),
                    AppHeight.h50,
                    CustomTextFormField(
                      hintText: "user name",
                      icon: Icons.person,
                      validator: (value) =>
                          provider.validateName(value ?? ""),
                    ),
                    AppHeight.h20,
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
                    SignUpButton(onPressed: () {
                      provider.signUp(context: context);
                    }),
                    OrDivider(),
                    SignInButton(onPressed: () {
                      Navigator.pop(context);
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
