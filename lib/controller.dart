import 'package:get/get.dart';

class PCC extends GetxController {
  int _api = 0;

  int get api => _api;

  void updateAPI(int i) {
    _api = i;
    update();
  }
}
