import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_v3/screens/test_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(2224, 1668),
      builder: ((context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: TestScreen(),
        );
      }),
    );
  }
}
