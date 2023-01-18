import 'package:get/get.dart';
import 'package:kiosk_v3/components/rest_api.dart';

import '../components/basic_function.dart';

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

  dynamic user_exist() async {
    var response = await post_data(url: 'user-exist/', data: {'member_id': user_info['member_id'].value});
    return response;
  }

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

  void modify_button(pet_info) {
    set_whole_user_info(pet_info);
  }

  void record_button(pet_info) {
    set_whole_user_info(pet_info);
  }

  void add_new_pet_button(member_id) {
    print(member_id);
    set_whole_user_info({
      'member_id': member_id,
      'name': '',
      'breed': '선택',
      'birth_year': '년',
      'birth_month': '월',
      'birth_day': '일',
      'sex': '0',
      'neutering': '0',
      'bcs': '0',
      'show_alg': '1',
      'alg': [],
      'alg_sub': [],
      'health': [],
      'weight': "",
    });
  }

  void set_whole_user_info(data) {
    user_info['member_id'](data['member_id']['member_id']);
    user_info['name'](data['name']);
    user_info['breed'](data['breed']);
    user_info['birth_year'](data['birth_year']);
    user_info['birth_month'](data['birth_month']);
    user_info['birth_day'](data['birth_day']);
    user_info['sex'](int.parse(data['sex']));
    user_info['neutering'](int.parse(data['neutering']));
    user_info['bcs'](int.parse(data['bcs']));
    user_info['alg'](str_to_list(data['alg']));
    user_info['show_alg'](user_info['alg'].length > 0 ? 0 : 1);
    user_info['alg_sub'](str_to_list(data['alg_sub']));
    user_info['health'](str_to_list(data['health']));
    user_info['weight'](data['weight']);
  }
}
