import 'package:get/get.dart';

class DisplayController extends GetxController {
  RxInt pet_type = 0.obs;
  RxInt popular_type = 0.obs;

  void set_pet_type(index) {
    pet_type(index);
  }

  bool is_selected_pet_type(index) {
    return index == pet_type.value;
  }

  void set_popular_type(index) {
    popular_type(index);
  }
}
