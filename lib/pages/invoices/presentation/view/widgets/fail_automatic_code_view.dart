
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_bottom_sheet.dart';
import 'package:fusion_warehouses/widgets/custom_button.dart';
import 'package:fusion_warehouses/widgets/custom_button_container.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:fusion_warehouses/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';




class FailCodeView extends StatelessWidget {
  String ?failname;

  FailCodeView({Key? key,this.failname}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(children: [
      AppSVGAssets.getWidget(AppSVGAssets.fail,
         ),
            SizedBox(width: 8,),
            CustomText(failname!,
                textStyle: TextStyles.textMedium.copyWith(
                    color: Color(ColorCode.semiBlack),
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp)),

          ],),

         SizedBox(height: 32,),
          CustomButtonContainer(

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
                  CustomText(AppStrings.again,
                      textStyle: TextStyles.textMedium.copyWith(
                          color: Color(ColorCode.semiBlack),
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp)),
                ],
              ),
                  () {
                Get.back();
              },
              backGroundColor: const Color(ColorCode.yellow),
            ),
            width: Get.width,
            height: 48.h,
          ),

        ],
      ),
    );
  }
}
