import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_v3/components/style.dart';
import 'package:kiosk_v3/controllers/pet_controller.dart';

import '../../components/basic_function.dart';
import '../../data/curation.dart';

class CurationRecommendPetfoodScreen extends StatelessWidget {
  CurationRecommendPetfoodScreen({super.key});
  var pet_controller = Get.put(PetController());
  @override
  Widget build(BuildContext context) {
    pet_controller.get_curation_petfood();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Obx(
        () => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              Text(
                '[ ${pet_controller.curation_data["name"]}를 위한 맞춤형 사료 ]',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                pet_controller.explain_text(),
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(height: 15.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                width: 600.w,
                color: grey_color,
                child: Column(
                  children: [
                    _pet_info_row(title: '연령', curation_info: pet_controller.curation_data['life_stage']),
                    SizedBox(height: 5.h),
                    _pet_info_row(title: '제외된 단백질', curation_info: list_to_str([...pet_controller.curation_data['alg'], ...pet_controller.curation_data['alg_sub']])),
                    SizedBox(height: 5.h),
                    _pet_info_row(title: '건강 고려사항', curation_info: list_to_str(pet_controller.curation_data['health'])),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  for (var index = 0; index < sort_petfood_text.length; index++)
                    InkWell(
                      child: Text(
                        sort_petfood_text[index],
                        style: TextStyle(fontSize: 10.sp, fontWeight: index == pet_controller.sort_index.value ? FontWeight.bold : FontWeight.w400),
                      ),
                      onTap: () {
                        pet_controller.set_sort_index(index);
                      },
                    ),
                ],
              ),
              Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children: [
                  for (var index = 0; index < pet_controller.curation_petfood[sort_text[pet_controller.sort_index.value]].length; index++)
                    Container(
                      width: 100.w,
                      height: 200.h,
                      color: grey_color,
                      child: Column(
                        children: [
                          Image.asset('assets/images/A000001.png'),
                          Text(list_to_str(pet_controller.curation_petfood[sort_text[pet_controller.sort_index.value]][index]['hash'])),
                          Text(pet_controller.curation_petfood[sort_text[pet_controller.sort_index.value]][index]['name']),
                          Text(pet_controller.curation_petfood[sort_text[pet_controller.sort_index.value]][index]['retail_price'].toString()),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pet_info_row({title, curation_info}) {
    return Row(
      children: [
        Container(
          width: 100.w,
          child: Text('${title}', style: TextStyle(fontSize: 12.sp)),
        ),
        Text(
          '${curation_info}',
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
