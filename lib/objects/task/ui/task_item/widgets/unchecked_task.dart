import 'package:do_it_flutter_v2/widgets/custom_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../task.dart';
import '../task_item_provider.dart';


class UncheckedTask extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskItemProvider>(context);
    return CustomItemWidget(
        text: "${provider.title}",
        circleColor: Color(provider.color),
        tapOnCircle: () {
          provider.check();
        });
  }
}
