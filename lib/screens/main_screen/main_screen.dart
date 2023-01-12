import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_v3/components/style.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, bottom: 10.h),
      child: Stack(
        children: [
          Container(
            width: 560.w,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [for (var index = 0; index < 20; index++) _petfood_form()],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [for (var index = 0; index < 15; index++) _petfood_form()],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _petfood_form() {
    return Padding(
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
            Text('브랜드'),
            Text('사료 이름'),
            SizedBox(height: 5.h),
            Text('가격 / 무게'),
          ],
        ),
      ),
    );
  }
}
