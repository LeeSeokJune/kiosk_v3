import 'package:get/get.dart';
import 'package:kiosk_v3/data/category.dart';
import 'package:kiosk_v3/data/petfood.dart';

class DisplayController extends GetxController {
  RxInt pet_type = 0.obs;
  var filtered_petfood_list = [];
  RxInt petfood_length = 0.obs;
  RxInt popular_type = 0.obs;
  RxInt sort_index = 0.obs;
  RxList unfold_big_category = [true.obs, false.obs, false.obs].obs;
  RxList show_all_filter_category = [false.obs, false.obs, false.obs].obs;
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
  RxList selected_filter_list = [[], []].obs;
  RxInt selected_filter_list_length = 0.obs;
  void onInit() {
    set_filtered_petfood_list();
  }

  void init_display() {
    // TODO : 초기화 작업
  }

  void set_pet_type(index) {
    pet_type(index);
    set_filtered_petfood_list();
    selected_filter_list_length.value = selected_filter_list[pet_type.value].length;
    for (var pet_index = 0; pet_index > selected_filter_category_list.length; pet_index++) {
      for (var category_index = 0; category_index < selected_filter_category_list[pet_index].length; category_index++) {
        selected_filter_category_list[pet_index][category_index].value = false;
      }
    }
  }

  void set_filtered_petfood_list() {
    filtered_petfood_list = main_petfood_list[pet_type.value][2];
    set_petfood_length();
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
    if (index == 0) {
    } else if (index == 1) {
      filtered_petfood_list.sort(((a, b) {
        return b['retail_price'].compareTo(a['retail_price']);
      }));
    } else if (index == 2) {
      filtered_petfood_list.sort(((a, b) {
        return a['retail_price'].compareTo(b['retail_price']);
      }));
    }
    petfood_length++;
    petfood_length--;
  }

  void set_unfold_big_category(index) {
    unfold_big_category[index](!unfold_big_category[index].value);
  }

  int category_list_number(category_index) {
    if (filter_category_list[pet_type.value][category_index].length > 3) {
      if (show_all_filter_category[category_index].value) {
        return filter_category_list[pet_type.value][category_index].length;
      } else {
        return 3;
      }
    }
    return 3;
  }

  void set_show_all_filter_category(index) {
    show_all_filter_category[index](!show_all_filter_category[index].value);
  }

  bool is_selected_sort_index(index) {
    return index == sort_index.value;
  }

  void set_selected_filter_category_list(category_index, index) {
    selected_filter_category_list[pet_type.value][category_index][index](!selected_filter_category_list[pet_type.value][category_index][index].value);
    set_selected_filter_list(filter_category_list[pet_type.value][category_index][index]);
    filtered_petfood_list = filtering_brand_category(main_petfood_list[pet_type.value][2], 0);
    filtered_petfood_list = filtering_multi_select_category(filtered_petfood_list, 1, 'health');
    filtered_petfood_list = filtering_multi_select_category(filtered_petfood_list, 2, 'main_ingredient');
    set_petfood_length();
  }

  void set_petfood_length() {
    petfood_length(filtered_petfood_list.length);
  }

  dynamic filtering_brand_category(current_petfood, category_index) {
    var temp_list = [];
    int count = selected_filter_category_list[pet_type.value][category_index].where((value) => value == true).length;
    if (count != 0) {
      for (var index = 0; index < selected_filter_category_list[pet_type.value][category_index].length; index++) {
        if (selected_filter_category_list[pet_type.value][category_index][index].value) {
          for (var petfood_index = 0; petfood_index < main_petfood_list[pet_type.value][2].length; petfood_index++) {
            if (filter_category_list[pet_type.value][category_index][index] == main_petfood_list[pet_type.value][2][petfood_index]['brand']) {
              temp_list.add(main_petfood_list[pet_type.value][2][petfood_index]);
            }
          }
        }
      }
      return temp_list;
    }
    return current_petfood;
  }

  dynamic filtering_multi_select_category(current_petfood, category_index, text) {
    var temp_list = [];
    int count = selected_filter_category_list[pet_type.value][category_index].where((value) => value == true).length;
    if (count != 0) {
      for (var petfood_index = 0; petfood_index < current_petfood.length; petfood_index++) {
        var flag = false;
        for (var checkbox_index = 0; checkbox_index < selected_filter_category_list[pet_type.value][category_index].length; checkbox_index++) {
          if (selected_filter_category_list[pet_type.value][category_index][checkbox_index].value) {
            if (current_petfood[petfood_index][text].indexOf(filter_category_list[pet_type.value][category_index][checkbox_index]) != -1) {
              flag = true;
            }
          }
        }
        if (flag) {
          temp_list.add(current_petfood[petfood_index]);
        }
      }
      return temp_list;
    }
    return current_petfood;
  }

  void set_selected_filter_list(category_name) {
    if (selected_filter_list[pet_type.value].indexOf(category_name) != -1) {
      selected_filter_list[pet_type.value].remove(category_name);
    } else {
      selected_filter_list[pet_type.value].add(category_name);
    }
    print(selected_filter_list);
    print(category_name);
    selected_filter_list_length.value = selected_filter_list[pet_type.value].length;
  }

  void remove_selected_filter_list(category_name) {
    for (var category = 0; category < filter_category_list[pet_type.value].length; category++) {
      var item_index = filter_category_list[pet_type.value][category].indexOf(category_name);
      if (item_index != -1) {
        set_selected_filter_category_list(category, item_index);
      }
    }
  }
}
