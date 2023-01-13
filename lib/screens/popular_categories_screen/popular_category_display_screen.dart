import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_v3/components/style.dart';
import 'package:kiosk_v3/controllers/display_controller.dart';
import 'package:kiosk_v3/data/category.dart';
import 'package:kiosk_v3/data/petfood.dart';

class PopularCategoryDisplayScreen extends StatelessWidget {
  PopularCategoryDisplayScreen({super.key});
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 30.h),
            _sort_container(),
            SizedBox(height: 10.h),
            Expanded(child: _show_popular_category_petfood()),
          ],
        ),
      ],
    );
  }

  Widget _show_popular_category_petfood() {
    return Obx(
      () => SingleChildScrollView(
        child: Container(
          width: 420.w,
          child: Wrap(
            spacing: 20.w,
            runSpacing: 10.h,
            children: [
              for (var index = 0; index < main_petfood_list[display_controller.pet_type.value][0].length; index++)
                Container(
                  width: 90.w,
                  height: 128.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/A000001.png',
                        width: 84.w,
                      ),
                      Text('${main_petfood_list[display_controller.pet_type.value][0][index]["brand"]}'),
                      Text('${main_petfood_list[display_controller.pet_type.value][0][index]["name"]}'),
                      SizedBox(height: 5.h),
                      Text('가격 / 무게'),
                    ],
                  ),
                )
            ],
          ),
        ),
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

  Column _category_container() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 10.h),
        Text(
          '인기 카테고리',
          style: TextStyle(fontSize: 15.sp),
        ),
        Divider(
          thickness: 1.h,
          color: Colors.black,
        ),
        SizedBox(height: 10.h),
        for (var index = 0; index < popular_category_text.length; index++) _popular_category_button(index),
      ],
    );
  }

  Widget _popular_category_button(int index) {
    return Obx(
      () => InkWell(
        child: Container(
          padding: EdgeInsets.only(
            left: display_controller.is_selected_popular_type(index) ? 30.w : 20.w,
            top: 5.h,
          ),
          width: 100.w,
          height: 26.h,
          decoration: BoxDecoration(
            color: display_controller.is_selected_popular_type(index) ? mint_color : background_color,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.w),
              bottomRight: Radius.circular(5.w),
            ),
          ),
          child: Text(
            '${popular_category_text[index]}',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: display_controller.is_selected_popular_type(index) ? FontWeight.bold : FontWeight.w400,
              color: display_controller.is_selected_popular_type(index) ? Colors.black : Color.fromRGBO(128, 128, 128, 1),
            ),
          ),
        ),
        onTap: () {
          display_controller.set_popular_type(index);
        },
      ),
    );
  }
}
