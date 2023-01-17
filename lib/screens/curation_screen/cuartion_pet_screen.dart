import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_v3/components/style.dart';
import 'package:kiosk_v3/controllers/pet_controller.dart';
import 'package:kiosk_v3/controllers/user_controller.dart';

class CurationPetScreen extends StatelessWidget {
  CurationPetScreen({super.key});
  var user_controller = Get.put(UserController());
  var pet_controller = Get.put(PetController());
  @override
  Widget build(BuildContext context) {
    pet_controller.set_pet_list();
    return Column(
      children: [
        SizedBox(height: 30.h),
        Text('등록하기', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 30.h),
        Expanded(
          child: Obx(
            () => Container(
              padding: EdgeInsets.only(top: 15.h),
              decoration: BoxDecoration(color: grey_color),
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    for (var pet_index = 0; pet_index < pet_controller.pet_list.length; pet_index++) _pet_container_form(pet_index),
                    _add_new_pet_button(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  InkWell _add_new_pet_button() {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Container(
          width: 120.w,
          height: 150.h,
          decoration: pet_container_style,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.control_point_duplicate,
                color: main_color,
                size: 30.w,
              ),
              SizedBox(height: 10.h),
              Text('추가 등록하기', style: TextStyle(fontSize: 13.sp)),
            ],
          ),
        ),
      ),
      onTap: () {
        // TODO : 큐레이션 페이지로 이동 및 초기화
      },
    );
  }

  Stack _pet_container_form(int pet_index) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Container(
            width: 120.w,
            height: 150.h,
            decoration: pet_container_style,
            child: Column(
              children: [
                Text(
                  pet_controller.pet_list[pet_index]['name'],
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: main_color),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      pet_controller.pet_age_sex_data(index: pet_index),
                      style: TextStyle(fontSize: 14.sp, color: main_color),
                    ),
                    pet_controller.pet_list[pet_index]['sex'] == '0' ? Icon(Icons.male, color: main_color, size: 20.w) : Icon(Icons.female, color: Colors.red, size: 20.w),
                  ],
                ),
                SizedBox(height: 10.h),
                InkWell(
                  child: Container(
                    width: 60.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: grey_color,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                      child: Text('정보 수정'),
                    ),
                  ),
                  onTap: () {
                    // TODO : 데이터 채워넣기
                    // user_info = pet_list[index]
                  },
                ),
                SizedBox(height: 10.h),
                InkWell(
                  child: Container(
                    width: 80.w,
                    height: 25.h,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.w), color: main_color),
                    child: Center(
                      child: Text('추천받기', style: TextStyle(fontSize: 11.sp, color: Colors.white)),
                    ),
                  ),
                  onTap: () {
                    // TODO : curation screen
                  },
                ),
                SizedBox(height: 5.h),
                InkWell(
                  child: Container(
                    width: 80.w,
                    height: 25.h,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.w), color: Color.fromRGBO(239, 245, 255, 1)),
                    child: Center(
                      child: Text('사료기록', style: TextStyle(fontSize: 11.sp, color: main_color)),
                    ),
                  ),
                  onTap: () {
                    // TODO : 기록화면
                  },
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Icon(
            Icons.do_not_disturb_on,
            size: 30.w,
            color: main_color,
          ),
        ),
      ],
    );
  }
}
