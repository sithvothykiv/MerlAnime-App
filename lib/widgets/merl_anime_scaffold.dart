import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_color.dart';

class MerlAnimeScaffoldWithBackButton extends StatelessWidget {
  const MerlAnimeScaffoldWithBackButton({
    Key? key,
    required this.appBarTitle,
    required this.body,
  }) : super(key: key);
  final String? appBarTitle;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: appBarTitle != null
            ? Text(
                appBarTitle!,
              )
            : null,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: body,
    );
  }
}
