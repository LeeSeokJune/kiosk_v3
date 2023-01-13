import 'package:get/get.dart';
import 'package:kiosk_v3/data/category.dart';

class DisplayController extends GetxController {
  RxInt pet_type = 0.obs;
  RxInt popular_type = 0.obs;
  RxInt sort_index = 0.obs;
  RxList unfold_big_category = [true.obs, false.obs, false.obs].obs;
  RxList selected_filter_category_list = [
    [
      List.generate(filter_category_list[0][0].length, (index) => false.obs),
      List.generate(filter_category_list[0][1].length, (index) => false.obs),
      List.generate(filter_category_list[0][2].length, (index) => false.obs),
    ],
    [
      List.generate(filter_category_list[1][0].length, (index) => false.obs),
      List.generate(filter_category_list[1][1].length, (index) => false.obs),
      List.generate(filter_category_list[1][2].length, (index) => false.obs),
    ]
  ].obs;

  void set_pet_type(index) {
    pet_type(index);
  }

  bool is_selected_pet_type(index) {
    return index == pet_type.value;
  }

  void set_popular_type(index) {
    popular_type(index);
  }

  bool is_selected_popular_type(index) {
    return index == popular_type.value;
  }

  void set_sort_index(index) {
    sort_index(index);
  }

  void set_unfold_big_category(index) {
    // print(unfold_big_category);
    unfold_big_category[index](!unfold_big_category[index].value);
  }

  bool is_selected_sort_index(index) {
    return index == sort_index.value;
  }

  void set_selected_filter_category_list(category_index, index) {
    selected_filter_category_list[pet_type.value][category_index][index](!selected_filter_category_list[pet_type.value][category_index][index].value);
  }
}
