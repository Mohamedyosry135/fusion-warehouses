import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:fusion_warehouses/consts/colors.dart';
class CustomContainer extends StatelessWidget {

  String branchName;
  String todaysStocktaking;
  String progress;
  String date;


CustomContainer({
    required this.branchName,
  required this.todaysStocktaking,
  required this.progress,
  required this.date
});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: Colors.white,

      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomText(
                  "${AppStrings.branch}: ",
              textStyle: TextStyles.textSmall.copyWith(
                fontWeight: FontWeight.w400,
              )),
              CustomText(branchName,
              textStyle: TextStyles.textSmall.copyWith(
                fontWeight: FontWeight.w400,
                color: const Color(ColorCode.cyan)
              )),
            ],
          ),
          Row(
            children: [
              CustomText(todaysStocktaking,
              textStyle: TextStyles.textMedium.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),),
            ],
          ),
          SizedBox(height: 12.h,),
          Row(
            children: [
              SizedBox(
                height: 12.h,
                  width: 12.w,
                  child: AppSVGAssets.getWidget(AppSVGAssets.clock)),
              SizedBox(width: 8.w,),
              CustomText(date,
              textStyle: TextStyles.textSmall.copyWith(
                color: const Color(ColorCode.gray),
                fontWeight: FontWeight.w400
              )),
            ],
          ),
          SizedBox(height: 10.h,),
          Row(
            children: [
              CustomText(progress,
                textStyle: TextStyles.textSmall.copyWith(
                fontWeight: FontWeight.w400,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
