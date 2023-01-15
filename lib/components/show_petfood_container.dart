import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kiosk_v3/components/style.dart';
import 'package:kiosk_v3/controllers/display_controller.dart';

class ShowPetfoodContainer extends StatelessWidget {
  ShowPetfoodContainer({super.key});

  var display_controller = Get.put(DisplayController());
  var f = NumberFormat('###,###,###,###');
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Container(
          width: 420.w,
          child: Wrap(
            spacing: 21.w,
            runSpacing: 10.h,
            children: [
              for (var index = 0; index < display_controller.petfood_length.value; index++)
                Container(
                  width: 125.w,
                  // height: 128.h,
                  height: 160.h,
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
                        '${display_controller.filtered_petfood_list[index]["brand"]}',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Color.fromRGBO(128, 128, 128, 1),
                        ),
                      ),
                      Text('${display_controller.filtered_petfood_list[index]["name"]}', style: TextStyle(fontSize: 12.sp)),
                      // SizedBox(height: 5.h),
                      Text(
                        '${f.format(display_controller.filtered_petfood_list[index]["retail_price"])}원 / ${display_controller.filtered_petfood_list[index]["weight"]}',
                        style: TextStyle(fontSize: 11.sp),
                      ),
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
