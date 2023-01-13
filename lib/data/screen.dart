import 'package:flutter/material.dart';
import 'package:kiosk_v3/screens/popular_categories_screen/popular_category_display_screen.dart';

import '../screens/main_screen/main_screen.dart';
import '../screens/popular_categories_screen/popular_category_screen.dart';

List navi_icons = ['assets/icons/home.png', 'assets/icons/star.png', 'assets/icons/filter.png', 'assets/icons/cat.png'];
List navi_Text = ['메인 화면', '인기 카테고리', '사료 필터', '1:1 사료 추천'];
List<Widget> screen_list = [MainScreen(), PopularCategoryScreen(), Container(), Container(), PopularCategoryDisplayScreen()];
