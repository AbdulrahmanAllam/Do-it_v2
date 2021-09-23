import 'package:do_it_flutter_v2/objects/task/ui/task_item/task_item_provider.dart';
import 'package:do_it_flutter_v2/utils/app_colors.dart';
import 'package:do_it_flutter_v2/widgets/custom_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../task.dart';


class CheckedTask extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskItemProvider>(context);
    return CustomItemWidget(
      text: "${provider.title}",
      circleColor: AppColors.grey,
      textStyle: TextStyle(decoration: TextDecoration.lineThrough),
      tapOnCircle: () { provider.check();}
    );
  }
}
