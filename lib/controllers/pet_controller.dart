import 'package:get/get.dart';
import 'package:kiosk_v3/controllers/user_controller.dart';

import '../components/rest_api.dart';

class PetController extends GetxController {
  var user_controller = Get.put(UserController());
  RxList pet_list = [].obs;
  RxInt pet_length = 0.obs;
  RxInt selected_pet_index = 0.obs;
  RxList selected_petfood_list = [].obs;
  RxInt selected_petfood_list_length = 0.obs;

  void set_pet_list() {
    post_data(url: 'pet-info/', data: {'member_id': user_controller.user_info['member_id'].value}).then(
      (response) => {
        print(response),
        pet_list = RxList(response),
        set_pet_length(),
      },
    );
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
}
