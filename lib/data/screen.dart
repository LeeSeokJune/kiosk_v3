import 'package:flutter/material.dart';
import 'package:kiosk_v3/screens/curation_screen/cuartion_pet_screen.dart';
import 'package:kiosk_v3/screens/curation_screen/cuartion_record_petfood_screen.dart';
import 'package:kiosk_v3/screens/curation_screen/curation_exist_user_screen.dart';
import 'package:kiosk_v3/screens/curation_screen/curation_input_screen.dart';
import 'package:kiosk_v3/screens/curation_screen/curation_main_screen.dart';
import 'package:kiosk_v3/screens/curation_screen/curation_new_user_screen.dart';
import 'package:kiosk_v3/screens/petfood_filter_screen/petfood_filter_screen.dart';
import 'package:kiosk_v3/screens/popular_categories_screen/popular_category_display_screen.dart';

import '../screens/main_screen/main_screen.dart';
import '../screens/popular_categories_screen/popular_category_screen.dart';

enum ScreenState {
  main_screen,
  popular_category_screen,
  petfood_filter_screen,
  curation_main_screen,
  popular_display_screen,
  curation_new_user_screen,
  curation_exist_user_screen,
  curation_input_screen,
  curation_pet_screen,
  curation_record_petfood_screen,
}

List navi_icons = ['assets/icons/home.png', 'assets/icons/star.png', 'assets/icons/filter.png', 'assets/icons/cat.png'];
List navi_Text = ['메인 화면', '인기 카테고리', '사료 필터', '1:1 사료 추천'];
List<Widget> screen_list = [
  MainScreen(),
  PopularCategoryScreen(),
  PetfoodFilterScreen(),
  CurationMainScreen(),
  PopularCategoryDisplayScreen(),
  CurationNewUserScreen(),
  CurationExistUserScreen(),
  CurationInputScreen(),
  CurationPetScreen(),
  CurationRecordPetfoodScreen(),
];
