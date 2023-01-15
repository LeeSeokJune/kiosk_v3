import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_v3/controllers/display_controller.dart';

class ShowPetfoodContainer extends StatelessWidget {
  ShowPetfoodContainer({super.key});

  var display_controller = Get.put(DisplayController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Container(
          width: 420.w,
          child: Wrap(
            spacing: 20.w,
            runSpacing: 10.h,
            children: [
              for (var index = 0; index < display_controller.petfood_length.value; index++)
                Container(
                  width: 90.w,
                  // height: 128.h,
                  height: 150.h,
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
                      Text('${display_controller.filtered_petfood_list[index]["brand"]}'),
                      Text('${display_controller.filtered_petfood_list[index]["name"]}'),
                      SizedBox(height: 5.h),
                      Text('가격 / 무게'),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
