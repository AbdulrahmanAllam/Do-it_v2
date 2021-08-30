import 'package:do_it_flutter_v2/utils/app_images.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.getPngImage("logo"),
      height: 100,
    );
  }
}
