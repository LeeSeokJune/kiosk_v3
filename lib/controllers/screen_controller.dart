import 'package:get/get.dart';

class ScreenController extends GetxController {
  RxInt screen_index = 0.obs;

  void set_screen_index(index) {
    screen_index(index);
  }

  bool is_selected_screen(index) {
    return index == screen_index.value;
  }
}
