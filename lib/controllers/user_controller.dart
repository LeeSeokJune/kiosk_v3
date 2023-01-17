import 'package:get/get.dart';

class UserController extends GetxController {
  RxBool agreement = false.obs;
  RxMap user_info = {
    'member_id': '01098701720'.obs,
    'name': ''.obs,
    'breed': '선택'.obs,
    'birth_year': '년'.obs,
    'birth_month': '월'.obs,
    'birth_day': '일'.obs,
    'sex': 0.obs,
    'neutering': 0.obs,
    'bcs': 0.obs,
    'show_alg': 1.obs,
    'alg': [].obs,
    'alg_sub': [].obs,
    'health': [].obs,
    'weight': "".obs,
  }.obs;
  void set_agreement() {
    agreement(!agreement.value);
  }

  void set_user_info({text, value}) {
    user_info[text](value);
    print(user_info[text]);
  }

  bool is_selected_user_info({text, index}) {
    return index == user_info[text].value;
  }

  void set_user_list_info({text, value}) {
    if (user_info[text].indexOf(value) != -1) {
      user_info[text].remove(value);
    } else {
      user_info[text].add(value);
    }
    print(user_info['alg_sub']);
  }

  bool is_selected_list_button({text, value}) {
    if (user_info[text].indexOf(value) != -1) {
      return true;
    }
    return false;
  }
}
