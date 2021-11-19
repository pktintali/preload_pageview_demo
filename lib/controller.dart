import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class PCC extends GetxController {
  int _api = 0;
  List<VideoPlayerController> videoPlayerControllers = [];
  List<int> initilizedIndexes = [];
  bool autoplay = true;
  int get api => _api;

  void updateAPI(int i) {
    _api = i;
    update();
  }

  // Future<void> fakeFuture() async {
  //   await Future.delayed(const Duration(seconds: 1));
  // }

  Future initializePlayer(int i) async {
    print('ZZZZZZZZZZZ 1');
    print('initializing $i');
    print('ZZZZZZZZZZ 2');
    late VideoPlayerController singleVideoController;
    singleVideoController = VideoPlayerController.network(videoURLs[i]);
    videoPlayerControllers.add(singleVideoController);
    initilizedIndexes.add(i);
    await videoPlayerControllers[i].initialize();
    update();
  }

  Future initializeIndexedController(int index) async {
    late VideoPlayerController singleVideoController;
    singleVideoController = VideoPlayerController.network(videoURLs[index]);
    videoPlayerControllers[index] = singleVideoController;
    await videoPlayerControllers[index].initialize();
    update();
  }

  // Future disposeController(int i) async {
  //   await videoPlayerControllers[i]!.dispose();
  //   videoPlayerControllers[i] = null;
  //   update();
  // }

  final List<String> videoURLs = [
    'http://www.exit109.com/~dnn/clips/RW20seconds_1.mp4',
    'http://www.exit109.com/~dnn/clips/RW20seconds_2.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-young-mother-with-her-little-daughter-decorating-a-christmas-tree-39745-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-taking-photos-from-different-angles-of-a-model-34421-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-winter-fashion-cold-looking-woman-concept-video-39874-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-womans-feet-splashing-in-the-pool-1261-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'
  ];
}
