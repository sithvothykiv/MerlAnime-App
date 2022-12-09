// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:merl_anime/utils/app_color.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/webview_manager.dart';
import '../theme/merl_anime_theme.dart';
import '../utils/constants.dart';
import '../utils/routes.dart';

class AnimeDrawer extends StatelessWidget {
  const AnimeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColor.primaryColor,
        child: ListView(
          children: [
            SizedBox(
              height: (screenHeight * .39).h,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    color: Colors.black45,
                  ),
                  Positioned(
                    right: 5,
                    left: 5,
                    bottom: 0,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      height: (screenHeight * .05).h,
                      child: Text(
                        'MerlAnime',
                        style: MerlAnimeTheme.darkTextTheme.headline4,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: (screenHeight * .02).h,
            ),
            ListTile(
              onTap: () => Get.toNamed(Routes.aboutAppScreen),
              hoverColor: Colors.white,
              leading: const Icon(Icons.info),
              title: const Text('About MerlAnime'),
            ),
            ListTile(
              onTap: () => Get.toNamed(Routes.genreSelectionScreen),
              hoverColor: Colors.white,
              leading: const Icon(Icons.list_outlined),
              title: const Text('Genres'),
            ),
            ListTile(
              onTap: () => Get.toNamed(Routes.settingsScreen),
              hoverColor: Colors.white,
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
