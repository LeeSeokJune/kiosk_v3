import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_v3/data/style.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.yellow),
                width: 1000,
                height: 200,
              ),
              Expanded(
                  child: Container(
                decoration: test_line,
              )),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(color: Colors.red),
                  width: 1000,
                  height: 200.h,
                ),
                onTap: () {
                  print(context.devicePixelRatio);
                  print(Get.width);
                  print(Get.height);
                },
              ),
            ],
          ),
          // Opacity(
          //   opacity: 0.5,
          //   child: Container(
          //     color: Colors.grey,
          //   ),
          // ),
          Container(
            width: 1000,
            height: 500,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
