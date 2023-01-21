import 'package:get/get.dart';
import 'package:kiosk_v3/controllers/user_controller.dart';
import 'package:kiosk_v3/data/curation.dart';
import 'package:kiosk_v3/data/petfood.dart';

import '../components/basic_function.dart';
import '../components/rest_api.dart';

class PetController extends GetxController {
  var user_controller = Get.put(UserController());
  RxList pet_list = [].obs;
  RxInt pet_length = 0.obs;
  RxInt selected_pet_index = 0.obs;
  RxList selected_petfood_list = [].obs;
  RxInt selected_petfood_list_length = 0.obs;
  RxMap curation_data = {}.obs;
  RxMap curation_petfood = {}.obs;
  RxInt sort_index = 0.obs;

  void set_sort_index(index) {
    sort_index(index);
  }

  void post_selected_petfood() {
    post_data(url: 'set-petfood/', data: {
      'member_id': pet_list[selected_pet_index.value]['member_id']['member_id'],
      'name': pet_list[selected_pet_index.value]['name'],
      'petfood': selected_petfood_list,
    }).then((response) {
      print(response);
    });
  }

  dynamic get_selected_petfood() {
    post_data(url: 'get-petfood/', data: {
      'member_id': pet_list[selected_pet_index.value]['member_id']['member_id'],
      'name': pet_list[selected_pet_index.value]['name'],
    }).then((response) {
      selected_petfood_list(str_to_list(response['petfood']));
      set_selected_petfood_list_length();
    });
    var sub_data = main_petfood_list[0][0][0];
    print(main_petfood_list[0][0].indexOf(sub_data));
  }

  void set_pet_list() {
    post_data(url: 'pet-info/', data: {'member_id': user_controller.user_info['member_id'].value}).then(
      (response) => {
        print(response),
        pet_list = RxList(response),
        set_pet_length(),
      },
    );
  }

  void get_curation_petfood() {
    post_data(url: 'curation/', data: pet_list[selected_pet_index.value]).then((response) => {
          curation_petfood = RxMap(response),
          curation_data = RxMap(response['curation_data']),
        });
  }

  void set_pet_length() {
    pet_length(pet_list.length);
  }

  void delete_button(index) {
    post_data(url: 'pet-delete/', data: pet_list[index]).then(
      (value) => {
        print(value),
        set_pet_list(),
      },
    );
  }

  void recommend_button(index) {
    set_selected_pet_index(index);
  }

  void set_selected_pet_index(index) {
    selected_pet_index(index);
  }

  String pet_age_sex_data({index}) {
    var str_data = '';
    str_data += pet_list[index]['age'].toString() + '살 ';
    str_data += pet_list[index]['sex'] == '0' ? '수컷' : '암컷';
    return str_data;
  }

  String pet_name() {
    return pet_list[selected_pet_index.value]['name'] + '(이)가 먹을 수 있는 사료 리스트';
  }

  void set_selected_petfood_list(petfood_name) {
    if (selected_petfood_list.indexOf(petfood_name) == -1) {
      selected_petfood_list.add(petfood_name);
    } else {
      selected_petfood_list.remove(petfood_name);
    }
    set_selected_petfood_list_length();
    print(selected_petfood_list);
  }

  void set_selected_petfood_list_length() {
    selected_petfood_list_length(selected_petfood_list.length);
  }

  String explain_text() {
    var text = '';
    if (curation_data['pet'] == '0') {
      if (curation_data['life_stage'] == '퍼피') {
        text += pet_explain_text_list[0];
      } else if (curation_data['life_stage'] == '어덜트') {
        if (curation_data['bcs'] != '2') {
          text += pet_explain_text_list[1];
        } else {
          text += pet_explain_text_list[2];
        }
      } else {
        if (curation_data['bcs'] != '2') {
          text += pet_explain_text_list[3];
        } else {
          text += pet_explain_text_list[4];
        }
      }
    } else {
      if (curation_data['life_stage'] == '키튼') {
        text += pet_explain_text_list[5];
      } else if (curation_data['life_stage'] == '어덜트') {
        if (curation_data['bcs'] != '2') {
          text += pet_explain_text_list[6];
        } else {
          text += pet_explain_text_list[7];
        }
      } else {
        if (curation_data['bcs'] != '2') {
          text += pet_explain_text_list[8];
        } else {
          text += pet_explain_text_list[9];
        }
      }
    }
    return text;
  }
}
