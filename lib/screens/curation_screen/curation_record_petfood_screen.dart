import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_v3/components/style.dart';
import 'package:kiosk_v3/controllers/pet_controller.dart';
import 'package:kiosk_v3/data/petfood.dart';

class CurationRecordPetfoodScreen extends StatelessWidget {
  CurationRecordPetfoodScreen({super.key});
  var pet_controller = Get.put(PetController());
  // TODO : 서버 연동
  // TODO : 사료 데이터 정리하고 다시 하기
  @override
  Widget build(BuildContext context) {
    pet_controller.get_selected_petfood();
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          children: [
            SizedBox(height: 15.h),
            Text(
              pet_controller.pet_name(),
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: main_color),
            ),
            SizedBox(height: 15.h),
            Container(
              height: 150.h,
              decoration: BoxDecoration(color: grey_color),
              child: Row(
                children: [
                  for (var selected_petfood_index = 0; selected_petfood_index < pet_controller.selected_petfood_list_length.value; selected_petfood_index++)
                    _selected_petfood_form(index: selected_petfood_index),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            InkWell(
              child: Container(
                width: 100.w,
                height: 30.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: main_color,
                ),
                child: Center(child: Text('저장하기', style: TextStyle(color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.bold))),
              ),
              onTap: () {
                pet_controller.post_selected_petfood();
              },
            ),
            SizedBox(height: 15.h),
            Wrap(
              spacing: 15.w,
              runSpacing: 15.h,
              children: [
                // TODO : 데이터 다시 정리
                for (var petfood_index = 0; petfood_index < petfood_name_list.length; petfood_index++)
                  InkWell(
                    child: Column(
                      children: [
                        Container(
                          width: 130.w,
                          height: 130.h,
                          color: grey_color,
                          // TODO: 사진
                          child: Image.asset('assets/images/A000001.png'),
                        ),
                        Container(width: 130.w, child: Text(petfood_name_list[petfood_index])),
                      ],
                    ),
                    onTap: () {
                      pet_controller.set_selected_petfood_list(petfood_name_list[petfood_index]);
                    },
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Stack _selected_petfood_form({index}) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Container(
            width: 80.w,
            height: 100.h,
            decoration: pet_container_style,
            child: Column(
              children: [
                Image.asset('assets/images/A000001.png'),
                Text(pet_controller.selected_petfood_list[index]),
              ],
            ),
          ),
        ),
        Positioned(
          right: 5.w,
          top: 5.h,
          child: InkWell(
            child: Icon(
              Icons.do_not_disturb_on,
              size: 20.w,
              color: main_color,
            ),
            onTap: () {
              pet_controller.set_selected_petfood_list(pet_controller.selected_petfood_list[index]);
            },
          ),
        ),
      ],
    );
  }
}
