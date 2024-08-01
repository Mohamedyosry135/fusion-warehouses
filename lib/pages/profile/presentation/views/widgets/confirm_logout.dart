import 'package:flutter/material.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/resources/assets_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/routes/app_pages.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/custom_button.dart';
import 'package:fusion_warehouses/widgets/custom_button_container.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class ConfirmLogout extends StatelessWidget {
  const ConfirmLogout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AppAssets.confirmLogout,
          ),
          SizedBox(height: 16.h),

          CustomText(
              AppStrings.confirmLogout,
              textStyle: TextStyles.textXLarge.copyWith(
                  color: Color(ColorCode.semiBlack),
                  fontWeight: FontWeight.w800,
                  fontSize: 24.sp)),

          SizedBox(height: 16.h),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButtonContainer(
              CustomButton(
                CustomText(
                    AppStrings.signOut,
                    textStyle: TextStyles.textMedium.copyWith(
                        color: const Color(ColorCode.white),
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp)),
                    () {
                  AuthService.to.logout();
                  Get.rootDelegate.offNamed(Routes.LOGIN);
                },
                backGroundColor: const Color(ColorCode.red),
              ),
              width: 192.w,
              height: 48.h,
            ),
          ),
          SizedBox(height: 32.h,),
          InkWell(
            onTap: (){
              Get.back();
            },
            child: CustomText(
                AppStrings.close,
                textStyle: TextStyles.textXLarge.copyWith(
                    color: Color(0xff969896),
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp)),
          ),
        ],
      ),
    );
  }
}
