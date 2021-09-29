
import 'package:do_it_flutter_v2/utils/app_height.dart';
import 'package:do_it_flutter_v2/utils/app_router.dart';
import 'package:do_it_flutter_v2/widgets/custom_app_bar.dart';
import 'package:do_it_flutter_v2/widgets/custom_text_form_field.dart';
import 'package:do_it_flutter_v2/widgets/cutom_material_button.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  static String route = AppRouter.addRoute(routeName: "AddTaskScreen", screen: AddTaskScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Add New Task"),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: "Title",
                  maxLength: 20,
                ),
                AppHeight.h30,
                CustomTextFormField(
                  hintText: "Description",
                  maxLines: 5,
                ),
                AppHeight.h30,
                Text("to select category"),
                AppHeight.expanded,
                CustomMaterialButton(
                  onPressed: () {
                    // TODO: add task
                  },
                  text: "Add",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
