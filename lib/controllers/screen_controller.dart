import 'package:get/get.dart';
import 'package:kiosk_v3/data/petfood.dart';
import 'package:kiosk_v3/data/screen.dart';

class ScreenController extends GetxController {
  RxInt screen_index = ScreenState.main_screen.index.obs;
  RxInt bottom_navi_index = 0.obs;
  RxBool background = false.obs;
  RxBool petfood_detail_container = false.obs;
  RxBool search_container = false.obs;
  RxString search_text = ''.obs;
  RxList search_petfood = [].obs;
  RxInt search_petfood_length = 0.obs;

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
    if (!search_container.value) {
      set_search_text('');
    }
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
    search_petfood_function();
  }

  bool search_text_bool() {
    var return_bool = search_text.value != '';
    print(return_bool);
    return return_bool;
  }

  void search_petfood_function() {
    var temp = [];
    for (var petfood_index = 0; petfood_index < main_petfood_list[0][2].length; petfood_index++) {
      if (main_petfood_list[0][2][petfood_index]['name'].toString().contains(search_text.value)) {
        temp.add(main_petfood_list[0][2][petfood_index]);
      } else if (main_petfood_list[0][2][petfood_index]['brand'].toString().contains(search_text.value)) {
        temp.add(main_petfood_list[0][2][petfood_index]);
      }
    }
    search_petfood = temp.obs;
    search_petfood_length(search_petfood.length);
    print(search_petfood_length);
  }
}
