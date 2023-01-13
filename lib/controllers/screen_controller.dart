import 'package:get/get.dart';

class ScreenController extends GetxController {
  RxInt screen_index = 2.obs;
  RxInt bottom_navi_index = 2.obs;

  void set_screen_index(index) {
    screen_index(index);
  }

  void set_navi_index(index) {
    screen_index(index);
    bottom_navi_index(index);
  }

  bool is_selected_screen(index) {
    return index == bottom_navi_index.value;
  }
}
