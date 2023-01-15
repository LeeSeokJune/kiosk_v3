import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_v3/controllers/display_controller.dart';

import '../../components/show_petfood_container.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 30.h),
              _category_button_container(),
              _sort_container(),
              SizedBox(height: 10.h),
              Expanded(child: ShowPetfoodContainer()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _category_button_container() {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Container(
          height: 20.h,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (var index = 0; index < display_controller.selected_filter_list.length; index++)
                  Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: InkWell(
                      child: Container(
                        height: 18.h,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(196, 221, 255, 1),
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: Row(
                            children: [
                              Text(
                                display_controller.selected_filter_list[index],
                                style: TextStyle(
                                  fontSize: 8.sp,
                                ),
                              ),
                              SizedBox(width: 3.w),
                              Icon(Icons.cancel_outlined)
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        display_controller.remove_selected_filter_list(display_controller.selected_filter_list[index]);
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
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
                  for (var index = 0; index < big_category_list.length; index++) _category_form(category_index: index),
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
          Visibility(
            visible: display_controller.unfold_big_category[category_index].value,
            child: Column(
              children: [
                for (var index = 0; index < display_controller.category_list_number(category_index); index++)
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(filter_category_list[display_controller.pet_type.value][category_index][index]),
                          Icon(
                            display_controller.selected_filter_category_list[display_controller.pet_type.value][category_index][index].value ? Icons.check_box_outlined : Icons.check_box_outline_blank,
                          ),
                        ],
                      ),
                      onTap: () {
                        display_controller.set_selected_filter_category_list(category_index, index);
                      },
                    ),
                  ),
                Visibility(
                  visible: !display_controller.show_all_filter_category[category_index].value,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0.h, bottom: 10.h),
                    child: InkWell(
                      child: Container(
                        width: 86.w,
                        height: 18.h,
                        decoration: BoxDecoration(color: grey_color),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '모두 보기',
                              style: TextStyle(fontSize: 8.sp, color: Color.fromRGBO(102, 102, 102, 1)),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 13.w,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        display_controller.set_show_all_filter_category(category_index);
                      },
                    ),
                  ),
                ),
              ],
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
