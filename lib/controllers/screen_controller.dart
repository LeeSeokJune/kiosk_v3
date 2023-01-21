import 'package:get/get.dart';
import 'package:kiosk_v3/data/screen.dart';

class ScreenController extends GetxController {
  RxInt screen_index = ScreenState.main_screen.index.obs;
  RxInt bottom_navi_index = 0.obs;
  RxBool background = false.obs;
  RxBool petfood_detail_container = false.obs;
  RxBool search_container = false.obs;
  RxString search_text = ''.obs;

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

  bool show_speech_bubble() {
    return speech_bubble.indexOf(screen_index.value) != -1;
  }

  void set_petfood_detail_container() {
    petfood_detail_container(!petfood_detail_container.value);
    set_background();
  }

  void set_search_container() {
    search_container(!search_container.value);
    set_background();
  }

  void set_background() {
    if (petfood_detail_container.value == false && search_container.value == false) {
      background(false);
    } else {
      background(true);
    }
    // background(!background.value);
  }

  void set_search_text(value) {
    search_text(value);
  }

  void search() {}
}
