// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/recent_watch_controller.dart';
import '../utils/constants.dart';
import '../widgets/recent_anime_card.dart';

class RecentListScreen extends StatelessWidget {
  final recentWatchController = Get.find<RecentWatchController>();

  RecentListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: recentWatchController.loadRecentAnimeFromDatabase(),
      builder: (_, snapshot) => GetBuilder<RecentWatchController>(
        builder: (_) => ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          itemCount: recentWatchController.animeList.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              behavior: HitTestBehavior.opaque,
              onDismissed: (_) {
                recentWatchController.removeAnime(recentWatchController.animeList[index].id);
                Get.snackbar(recentWatchController.animeList[index].name, 'Removed from recent successfully!',
                    backgroundColor: Colors.black38, duration: const Duration(milliseconds: 1300), snackPosition: SnackPosition.BOTTOM);
              },
              direction: DismissDirection.endToStart,
              background: const Icon(
                Icons.delete_rounded,
                color: Color.fromARGB(51, 15, 33, 198),
              ),
              child: RecentAnimeCard(
                id: recentWatchController.animeList[index].id,
                currentEp: recentWatchController.animeList[index].currentEp,
                epUrl: recentWatchController.animeList[index].epUrl,
                name: recentWatchController.animeList[index].name,
                imageUrl: recentWatchController.animeList[index].imageUrl,
                // animeUrl: recentWatchManager.animeList[index].animeUrl,
              ),
            );
          },
        ),
      ),
    );
  }
}
