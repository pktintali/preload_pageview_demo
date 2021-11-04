import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preload/controller.dart';

class Player extends StatefulWidget {
  final String s;
  final int i;
  const Player({
    Key? key,
    required this.s,
    required this.i,
  }) : super(key: key);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  Future<String> getFuture() async {
    await Future.delayed(const Duration(seconds: 1));
    return widget.s;
  }

  final PCC c = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getFuture(),
      builder: (cx, s) {
        if (s.hasData) {
          return GetBuilder<PCC>(builder: (_) {
            if (widget.i == c.api) {
              //Set AutoPlay True Here
              //If Index equals Auto Play Index
              print('AutoPlaying ${c.api}');
            } else {
              //Set AutoPlay False
              print('AutoPlay Stopped for ${widget.i}');
            }
            //Player Here
            return Column(
              children: [
                Text(s.data.toString()),
                Text(widget.s),
              ],
            );
          });
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
