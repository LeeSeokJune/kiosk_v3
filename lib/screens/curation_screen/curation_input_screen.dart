import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_v3/components/style.dart';
import 'package:kiosk_v3/controllers/display_controller.dart';
import 'package:kiosk_v3/controllers/user_controller.dart';
import 'package:kiosk_v3/data/curation.dart';

class CurationInputScreen extends StatelessWidget {
  CurationInputScreen({super.key});
  var user_controller = Get.put(UserController());
  var display_controller = Get.put(DisplayController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Container(
        width: 600.w,
        color: Color.fromRGBO(248, 248, 248, 1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text(
                '내 반려 동물의 기본정보를 알려주세요.',
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),
              _custom_textfield(title: '이름', text: 'pet_name'),
              SizedBox(height: 15.h),
              _breed_dropdown(),
              SizedBox(height: 15.h),
              _birth_dropdown(),
              SizedBox(height: 15.h),
              _sex_form(),
              SizedBox(height: 15.h),
              _neutering_form(),
              SizedBox(height: 15.h),
              _custom_textfield(title: "몸무게", text: "weight", hint: 'Kg'),
              SizedBox(height: 15.h),
              _bcs_form(),
              SizedBox(height: 15.h),
              _show_alg_form(),
              SizedBox(height: 15.h),
              _alg_form(),
              _healthcare_form(),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _screen_move_button(text: '이전', fill: false),
                  SizedBox(width: 5.w),
                  _screen_move_button(text: '다음', fill: true),
                ],
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _screen_move_button({screen_num, text, fill}) {
    return InkWell(
      child: Container(
        width: 60.w,
        height: 20.h,
        decoration: fill
            ? BoxDecoration(color: main_color, borderRadius: BorderRadius.circular(5.w))
            : BoxDecoration(
                border: Border.all(color: main_color, width: 2.w),
                borderRadius: BorderRadius.circular(5.w),
              ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 5.sp, color: fill ? Colors.white : main_color, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      onTap: () {},
    );
  }

  Widget _sex_form() {
    return _row_form(
      child: Row(
        children: [
          _custom_title_form(title: '성별'),
          _select_button(index: 0, text: 'sex', list: sex),
          SizedBox(width: 5.w),
          _select_button(index: 1, text: 'sex', list: sex),
        ],
      ),
    );
  }

  Widget _neutering_form() {
    return _row_form(
      child: Row(
        children: [
          _custom_title_form(title: '중성화 여부'),
          _select_button(index: 0, text: 'neutering', list: y_n),
          SizedBox(width: 5.w),
          _select_button(index: 1, text: 'neutering', list: y_n),
        ],
      ),
    );
  }

  Widget _healthcare_form() {
    return _row_form(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _custom_title_form(title: '건강관리'),
          Container(
            width: curation_container_width,
            child: Obx(
              () => Wrap(
                spacing: 5.w,
                runSpacing: 5.h,
                children: [
                  for (var health_index = 0; health_index < healthcare[display_controller.pet_type.value].length; health_index++)
                    _multi_select_button(index: health_index, text: 'health', list: healthcare),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Obx _alg_form() {
    return Obx(
      () => Visibility(
        visible: user_controller.user_info['show_alg'].value == 0,
        child: _row_form(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _custom_title_form(title: '알러지'),
                  Container(
                    width: curation_container_width,
                    child: Wrap(
                      spacing: 5.w,
                      runSpacing: 5.h,
                      children: [
                        for (var alg_index = 0; alg_index < alg[display_controller.pet_type.value].length; alg_index++) _multi_select_button(index: alg_index, text: 'alg', list: alg),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _show_alg_form() {
    return _row_form(
      child: Row(children: [
        _custom_title_form(title: '알러지 여부'),
        _select_button(index: 0, text: 'show_alg', list: y_n),
        SizedBox(width: 5.w),
        _select_button(index: 1, text: 'show_alg', list: y_n),
      ]),
    );
  }

  Widget _bcs_form() {
    return _row_form(
      child: Row(
        children: [
          _custom_title_form(title: '체형'),
          _select_button(index: 0, text: 'bcs', list: bcs),
          SizedBox(width: 5.w),
          _select_button(index: 1, text: 'bcs', list: bcs),
          SizedBox(width: 5.w),
          _select_button(index: 2, text: 'bcs', list: bcs),
        ],
      ),
    );
  }

  Obx _multi_select_button({index, text, list}) {
    return Obx(
      () => InkWell(
        child: Container(
          width: 37.w,
          height: 20.h,
          decoration: user_controller.is_selected_list_button(text: text, value: list[display_controller.pet_type.value][index]) ? louis_box_deco : white_box_deco,
          child: Center(
            child: Text(
              list[display_controller.pet_type.value][index],
              style: user_controller.is_selected_list_button(
                text: text,
                value: list[display_controller.pet_type.value][index],
              )
                  ? curation_selected_contents_style
                  : curation_contents_style,
            ),
          ),
        ),
        onTap: () {
          user_controller.set_user_list_info(text: text, value: list[display_controller.pet_type.value][index]);
        },
      ),
    );
  }

  Widget _select_button({index, text, list}) {
    return Obx(
      () => InkWell(
        child: Container(
          width: small_container_width,
          height: curation_box_height,
          decoration: user_controller.is_selected_user_info(text: text, index: index) ? louis_box_deco : white_box_deco,
          child: Center(
            child: Text(
              list[index],
              style: user_controller.is_selected_user_info(text: text, index: index) ? curation_selected_contents_style : curation_contents_style,
            ),
          ),
        ),
        onTap: () {
          user_controller.set_user_info(text: text, value: index);
        },
      ),
    );
  }

  Widget _birth_dropdown() {
    return _row_form(
      child: Row(
        children: [
          _custom_title_form(title: '생년월일'),
          _custom_dropdown_search(width: small_container_width, text: 'birth_year', list: birth_year),
          SizedBox(width: 5.w),
          _custom_dropdown_search(width: small_container_width, text: 'birth_month', list: birth_month),
          SizedBox(width: 5.w),
          _custom_dropdown_search(width: small_container_width, text: 'birth_day', list: birth_day),
        ],
      ),
    );
  }

  Widget _breed_dropdown() {
    return _row_form(
      child: Obx(
        () => Row(
          children: [
            _custom_title_form(title: pet_breed_text[display_controller.pet_type.value]),
            _custom_dropdown_search(width: curation_container_width, text: 'breed', list: breed[display_controller.pet_type.value]),
          ],
        ),
      ),
    );
  }

  Widget _custom_dropdown_search({width, text, list}) {
    return Container(
      width: width,
      height: curation_box_height,
      padding: EdgeInsets.only(left: 10.w),
      decoration: white_box_deco,
      child: DropdownSearch(
        dropdownDecoratorProps: DropDownDecoratorProps(dropdownSearchDecoration: InputDecoration(border: InputBorder.none)),
        dropdownBuilder: ((context, selectedItem) {
          return Text(selectedItem ?? "", style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w500));
        }),
        popupProps: PopupProps.menu(
          showSelectedItems: true,
          disabledItemFn: (String s) => s.startsWith('I'),
        ),
        items: list,
        selectedItem: user_controller.user_info[text].toString(),
        onChanged: (value) {
          user_controller.set_user_info(text: text, value: value);
        },
      ),
    );
  }

  Widget _custom_textfield({title, text, hint}) {
    return _row_form(
      child: Row(
        children: [
          _custom_title_form(title: title),
          Container(
            width: curation_container_width,
            height: curation_box_height,
            padding: EdgeInsets.only(left: 10.w),
            decoration: white_box_deco,
            child: TextField(
              decoration: InputDecoration(border: InputBorder.none, hintText: hint ?? ""),
              onChanged: (value) {
                user_controller.set_user_info(text: text, value: value);
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _custom_title_form({title}) {
    return Container(
      padding: EdgeInsets.only(top: 4.h),
      width: curation_title_width,
      height: curation_box_height,
      child: Text(
        title,
        style: curation_subtitle_style,
      ),
    );
  }

  Widget _row_form({child}) {
    return Container(width: curation_row_width, child: child);
  }
}