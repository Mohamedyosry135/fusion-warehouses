
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_button.dart';
import 'package:fusion_warehouses/widgets/custom_button_container.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:fusion_warehouses/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class SearchView extends StatelessWidget {

  SearchView({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextFormField(
            decoration:  InputDecoration(
              contentPadding: EdgeInsets.all(8),
              labelText: AppStrings.search,
              labelStyle: TextStyle(
                  color: Color(ColorCode.semiBlack),
                  fontSize: 10,
                  fontWeight: FontWeight.w400),
              enabledBorder: UnderlineInputBorder(
                //<-- SEE HERE
                borderSide: BorderSide(
                    width: 1, color: Colors.greenAccent),
              ),
            ),
            onSave: (text) {},
            hint: '',
            inputType: TextInputType.text,
            label: AppStrings.phoneNumber,
          ),
          SizedBox(
            height: 32,
          ),
          CustomButtonContainer(
            CustomButton(
              CustomText(AppStrings.search,
                  textStyle: TextStyles.textMedium.copyWith(
                      color: Color(ColorCode.semiBlack),
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp)),
                  () {},
              backGroundColor: const Color(ColorCode.yellow),
            ),
            width: Get.width,
            height: 48.h,
          ),
          SizedBox(
            height: 24,
          ),
          CustomButtonContainer(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Color(ColorCode.semiBlack),
                  width: 1),
              borderRadius: BorderRadius.circular(25),
            ),
            CustomButton(
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppSVGAssets.getWidget(
                    AppSVGAssets.code,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  CustomText(AppStrings.scanTheProductBarcode,
                      textStyle: TextStyles.textMedium
                          .copyWith(
                          color:
                          Color(ColorCode.semiBlack),
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp)),
                ],
              ),
                  () {},
              backGroundColor: const Color(ColorCode.white),
            ),
            width: Get.width,
            height: 48.h,
          ),
        ],
      ),
    );
  }
}
