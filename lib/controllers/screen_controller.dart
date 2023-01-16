import 'package:get/get.dart';
import 'package:kiosk_v3/data/screen.dart';

class ScreenController extends GetxController {
  RxInt screen_index = ScreenState.curation_input_screen.index.obs;
  RxInt bottom_navi_index = 3.obs;

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
