import 'package:get/get.dart';
import 'package:kiosk_v3/controllers/user_controller.dart';

import '../components/rest_api.dart';

class PetController extends GetxController {
  var user_controller = Get.put(UserController());
  var data;
  RxList pet_list = [].obs;

  void set_pet_list() {
    post_data(url: 'pet-info/', data: {'member_id': user_controller.user_info['member_id'].value}).then(
      (response) => {
        print(response),
        pet_list = RxList(response),
      },
    );
  }

  String pet_age_sex_data({index}) {
    var str_data = '';
    str_data += pet_list[index]['age'].toString() + '살 ';
    str_data += pet_list[index]['sex'] == '0' ? '수컷' : '암컷';
    return str_data;
  }
}
