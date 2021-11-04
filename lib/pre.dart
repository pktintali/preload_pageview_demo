import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preload/controller.dart';
import 'package:preload/player.dart';
import 'package:preload_page_view/preload_page_view.dart';

class Pre extends StatelessWidget {
  Pre({Key? key}) : super(key: key);
  final List<String> d = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];
  final cc = Get.put(PCC());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Stack(
            children: [
              PreloadPageView.builder(
                itemBuilder: (c, i) {
                  return Player(
                    s: d[i],
                    i: i,
                  );
                },
                onPageChanged: (i) {
                  //Updating Auto Play Index(API) on Page Change
                  cc.updateAPI(i);
                },
                preloadPagesCount: 4,
                controller: PreloadPageController(initialPage: 0),
                itemCount: d.length,
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Flutter Shorts',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(Icons.camera_alt),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
