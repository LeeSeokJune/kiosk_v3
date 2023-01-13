import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_v3/controllers/display_controller.dart';

import '../../components/style.dart';
import '../../data/category.dart';

class PetfoodFilterScreen extends StatelessWidget {
  PetfoodFilterScreen({super.key});
  var display_controller = Get.put(DisplayController());
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100.w,
          child: _category_container(),
        ),
        SizedBox(width: 61.w),
        Container(
          width: 420.w,
          decoration: test_line,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 30.h),
              _sort_container(),
              SizedBox(height: 10.h),
              // Expanded(child: _show_popular_category_petfood()),
            ],
          ),
        ),
      ],
    );
  }

  Column _category_container() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text(
            '사료 필터',
            style: TextStyle(fontSize: 15.sp),
          ),
        ),
        Divider(
          thickness: 1.h,
          color: Colors.black,
        ),
        // TODO : 카테고리
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Column(
                children: [
                  _category_form(category_index: CategoryState.brand.index),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _category_form({category_index}) {
    return Obx(
      () => Column(
        children: [
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  big_category_list[category_index],
                  style: TextStyle(fontSize: 11.sp),
                ),
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 15.w,
                ),
              ],
            ),
            onTap: () {
              display_controller.set_unfold_big_category(category_index);
            },
          ),
          for (var index = 0; index < filter_category_list[display_controller.pet_type.value][CategoryState.brand.index].length; index++)
            Visibility(
              visible: display_controller.unfold_big_category[category_index].value,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(filter_category_list[display_controller.pet_type.value][0][index]),
                      Icon(
                        display_controller.selected_filter_category_list[display_controller.pet_type.value][CategoryState.brand.index][index].value
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank,
                      ),
                    ],
                  ),
                  onTap: () {
                    display_controller.set_selected_filter_category_list(CategoryState.brand.index, index);
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  Row _sort_container() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _sort_button(index: 0),
        SizedBox(width: 4.w),
        Container(
          width: 1.w,
          height: 8.h,
          color: Color.fromRGBO(152, 152, 152, 1),
        ),
        SizedBox(width: 4.w),
        _sort_button(index: 1),
        SizedBox(width: 4.w),
        Container(
          width: 1.w,
          height: 8.h,
          color: Color.fromRGBO(152, 152, 152, 1),
        ),
        SizedBox(width: 4.w),
        _sort_button(index: 2),
        SizedBox(width: 4.w),
      ],
    );
  }

  Widget _sort_button({index}) {
    return Obx(
      () => InkWell(
        child: Text(
          '${sort_text[index]}',
          style: TextStyle(
            fontSize: 8.sp,
            color: display_controller.is_selected_sort_index(index) ? Colors.black : Color.fromRGBO(152, 152, 152, 1),
            fontWeight: display_controller.is_selected_sort_index(index) ? FontWeight.bold : FontWeight.w400,
          ),
        ),
        onTap: () {
          display_controller.set_sort_index(index);
        },
      ),
    );
  }
}
