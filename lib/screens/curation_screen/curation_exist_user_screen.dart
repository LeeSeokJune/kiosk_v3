import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_v3/controllers/screen_controller.dart';
import 'package:kiosk_v3/controllers/user_controller.dart';

import '../../components/style.dart';
import '../../data/screen.dart';

class CurationExistUserScreen extends StatelessWidget {
  CurationExistUserScreen({super.key});
  var screen_controller = Get.put(ScreenController());
  var user_controller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 60.h),
          Text(
            '기존에 등록된 휴대폰 번호를 입력해주세요.\n지난 번 입력한 반려동물 정보를 불러올게요!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.sp,
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('휴대폰 번호', style: TextStyle(fontSize: 14.sp)),
              SizedBox(width: 10.w),
              Container(
                width: 168.w,
                height: 30.h,
                padding: EdgeInsets.only(left: 10.w),
                decoration: black_border,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: ((value) {
                    user_controller.set_user_info(text: 'user_id', value: value);
                  }),
                ),
              ),
              SizedBox(width: 10.w),
              InkWell(
                child: Container(
                  width: 52.w,
                  height: 30.h,
                  decoration: black_border,
                  child: Center(
                    child: Text('확인', style: TextStyle(fontSize: 15.sp)),
                  ),
                ),
                onTap: () {
                  // TODO : 휴대폰 번호가 없을때, 신규회원으로 이동
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
