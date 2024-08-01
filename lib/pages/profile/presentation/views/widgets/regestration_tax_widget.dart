import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/profile/presentation/controllers/profile_controller.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';

class RegestrationTaxNumberWidget extends GetView<ProfileController> {
  const RegestrationTaxNumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
          color: Color(ColorCode.white),
          borderRadius: BorderRadius.circular(5.r),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppSVGAssets.getWidget(AppSVGAssets.taxNumber),
              SizedBox(
                width: 8.w,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: CustomText(
                  AppStrings.taxRegistrationNumber,
                  textStyle: TextStyles.textLarge.copyWith(
                      fontSize: 12.sp,
                      color: const Color(ColorCode.semiBlack),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h,),
          CustomText(
            controller.profileData.value.data?.shop?.taxNumber ?? "***********",
            textStyle: TextStyles.textLarge.copyWith(
                fontSize: 10.sp,
                color: const Color(ColorCode.semiBlack),
                fontWeight: FontWeight.w500),
          ),

        ],
      ),
    );
  }
}
