import 'package:do_it_flutter_v2/utils/app_colors.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        _divider(),
        SizedBox(
          width: 10,
        ),
        Text(
          "or",
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(
          width: 10,
        ),
        _divider(),
      ],
    );
  }
  Widget _divider() {
    return Expanded(
      child: Divider(
        height: 50,
        thickness: 1,
        color: AppColors.black,
      ),
    );
  }
}
