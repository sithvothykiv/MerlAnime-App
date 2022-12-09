// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bookmark_controller.dart';
import '../theme/merl_anime_theme.dart';
import '../utils/app_color.dart';
import '../utils/constants.dart';
import '../utils/routes.dart';
import '../widgets/cache_image_with_cachemanager.dart';

class BookMarksScreen extends StatelessWidget {
  final bookmarkController = Get.find<BookMarkController>();

  BookMarksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: bookmarkController.loadBookMarksFromDatabase(),
      builder: (context, snapshot) => GetBuilder<BookMarkController>(
        builder: (_) => ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: bookmarkController.bookMarks.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (_) {
                bookmarkController.removeFromBookMarks(bookmarkController.bookMarks[index]);
                Get.snackbar(bookmarkController.bookMarks[index].name, 'Removed from bookmark successfully!',
                    backgroundColor: Colors.black38, duration: const Duration(milliseconds: 1300), snackPosition: SnackPosition.BOTTOM);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.black38),
                child: Material(
                  color: AppColor.primaryColor.withOpacity(0.60),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.videoListScreen, arguments: {'anime': bookmarkController.bookMarks[index]});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 0.6,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: NetworkImageWithCacheManager(
                              imageUrl: bookmarkController.bookMarks[index].imageUrl,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            alignment: Alignment.topLeft,
                            child: Text(
                              bookmarkController.bookMarks[index].name,
                              softWrap: true,
                              style: MerlAnimeTheme.darkTextTheme.headline3,
                            ),
                          ),
                        ), /*
                          IconButton(
                            onPressed: () {
                              var bookmark = bookmarkMaanger.bookMarks[index];
                              bookmarkMaanger.removeFromBookMarks(bookmark);
                              Get.snackbar(bookmark.name, 'Removed from bookmark successfully!',
                                  backgroundColor: Colors.black38, duration: const Duration(milliseconds: 1300), snackPosition: SnackPosition.BOTTOM);
                            },
                            icon: const Icon(
                              Icons.bookmark_remove_rounded,
                              color: Color.fromARGB(255, 233, 5, 39),
                              semanticLabel: 'Remove',
                            ),
                          )*/
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
