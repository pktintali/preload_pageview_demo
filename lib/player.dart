import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preload/controller.dart';
import 'package:video_player/video_player.dart';

class Player extends StatelessWidget {
  final int i;
  Player({
    Key? key,
    required this.i,
  }) : super(key: key);

  final PCC c = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PCC>(
      initState: (x) async {
        print('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX1');
        print(i);
        print('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX2');
        // if (c.api > 1 && i == c.api) {
        //   await c.disposeController(c.api - 2);
        // }
        if (!c.initilizedIndexes.contains(i)) {
          await c.initializePlayer(i);
        }
        // if(c.videoPlayerControllers[i]==null){
        //   await c.initializeIndexedController(i);
        // }
        if (c.api > 1) {
          await c.videoPlayerControllers[c.api - 2].dispose();
        }
      },
      builder: (_) {
        if (c.videoPlayerControllers.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!c.videoPlayerControllers[c.api].value.isInitialized) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.green,
          ));
        }
        if (i == c.api) {
          //Set AutoPlay True Here
          if (i < c.videoPlayerControllers.length) {
            if (c.videoPlayerControllers[c.api].value.isInitialized) {
              c.videoPlayerControllers[c.api].play();
            }
          }
          //If Index equals Auto Play Index
          print('AutoPlaying ${c.api}');
        }
        return Stack(
          children: [
            c.videoPlayerControllers.isNotEmpty &&
                    c.videoPlayerControllers[c.api].value.isInitialized
                ? GestureDetector(
                    onTap: () {
                      if (c.videoPlayerControllers[c.api].value.isPlaying) {
                        print("paused");
                        c.videoPlayerControllers[c.api].pause();
                      } else {
                        c.videoPlayerControllers[c.api].play();
                        print("playing");
                      }
                    },
                    child: VideoPlayer(c.videoPlayerControllers[c.api]),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.lightBlueAccent,
                    ),
                  ),
          ],
        );
      },
    );
  }
}
