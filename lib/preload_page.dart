import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preload/controller.dart';
import 'package:preload/player.dart';
import 'package:preload_page_view/preload_page_view.dart';

class PreloadPage extends StatelessWidget {
  const PreloadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(PCC());
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: PreloadPageView.builder(
            itemBuilder: (ctx, i) {
              return Player(i: i);
            },
            onPageChanged: (i) async {
              c.updateAPI(i);
            },
            //If you are increasing or descrising preaload page count change accordingly in the player widget
            preloadPagesCount: 1,
            controller: PreloadPageController(initialPage: 0),
            itemCount: c.videoURLs.length,
            scrollDirection: Axis.vertical,
            physics: const AlwaysScrollableScrollPhysics(),
          ),
        ),
      ),
    );
  }
}
