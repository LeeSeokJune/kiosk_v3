import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_v3/controllers/display_controller.dart';
import 'package:kiosk_v3/data/screen.dart';
import '../../controllers/screen_controller.dart';

class PopularCategoryScreen extends StatelessWidget {
  PopularCategoryScreen({super.key});
  List popular_category_text = ['브랜드별', '퍼피', '어덜트', '시니어', '그레인프리', '단일단백질', '곤충사료', '다이어트'];
  var screen_controller = Get.put(ScreenController());
  var display_controller = Get.put(DisplayController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 30.w),
      child: Wrap(
        children: [
          for (var index = 0; index < popular_category_text.length; index++)
            Padding(
              padding: EdgeInsets.only(right: 30.w, bottom: 20.h),
              child: _category_container_form(index),
            )
        ],
      ),
    );
  }

  InkWell _category_container_form(int index) {
    return InkWell(
      child: Container(
        width: 92.w,
        height: 105.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.w),
        ),
        child: Column(children: [
          Image.asset(
            'assets/images/A000001.png',
            width: 63.w,
          ),
          Text(
            '${popular_category_text[index]}',
            style: TextStyle(fontSize: 12.sp),
          ),
        ]),
      ),
      onTap: () {
        screen_controller.set_screen_index(4);
        display_controller.set_popular_type(index);
      },
    );
  }
}
