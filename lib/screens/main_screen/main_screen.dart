import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kiosk_v3/controllers/display_controller.dart';
import 'package:kiosk_v3/controllers/screen_controller.dart';
import 'package:kiosk_v3/data/petfood.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  var display_controller = Get.put(DisplayController());
  var screen_controller = Get.put(ScreenController());
  var f = NumberFormat('###,###,###,###');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, bottom: 10.h),
      child: Container(
        width: 560.w,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [for (var index = 0; index < main_petfood_list[display_controller.pet_type.value][0].length; index++) _petfood_form(row: 0, index: index)],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [for (var index = 0; index < main_petfood_list[display_controller.pet_type.value][1].length; index++) _petfood_form(row: 1, index: index)],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _petfood_form({row, index}) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.only(right: 20.w),
        child: Container(
          width: 93.w,
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
              Text(
                '${main_petfood_list[display_controller.pet_type.value][row][index]["brand"]}',
                style: TextStyle(fontSize: 9.sp),
              ),
              Text(
                '${main_petfood_list[display_controller.pet_type.value][row][index]["name"]}',
                style: TextStyle(fontSize: 10.sp),
              ),
              // SizedBox(height: 5.h),
              Text(
                '${f.format(display_controller.filtered_petfood_list[index]["retail_price"])}원 / ${display_controller.filtered_petfood_list[index]["weight"]}',
                style: TextStyle(
                  fontSize: 10.sp,
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        screen_controller.set_petfood_detail_container();
      },
    );
  }
}
