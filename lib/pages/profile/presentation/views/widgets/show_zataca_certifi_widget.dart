import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/profile/presentation/controllers/profile_controller.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ShowZatcaCertificateWidget extends GetView<ProfileController> {
  const ShowZatcaCertificateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) => controller.certificateRespModel.value.data != null ? Container(
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
              AppSVGAssets.getWidget(AppSVGAssets.badgeDone),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: CustomText(
                  AppStrings.certificateTitle,
                  textAlign: TextAlign.start,
                  textStyle: TextStyles.textLarge.copyWith(
                      fontSize: 12.sp,
                      color: const Color(ColorCode.semiBlack),
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              CustomText(
                AppStrings.dateCreated,
                textStyle: TextStyles.textLarge.copyWith(
                    fontSize: 12.sp,
                    color: const Color(ColorCode.semiBlack),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 8.w,
              ),
              CustomText(
                DateFormat('yyyy/mm/dd hh:mm a', AuthService.to.language)
                    .format(DateTime.parse(
                    DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
                        .parse(controller.certificateRespModel.value.data
                        ?.createdAt ??
                        "")
                        .toString())),
                textStyle: TextStyles.textLarge.copyWith(
                    fontSize: 12.sp,
                    color: const Color(ColorCode.semiBlack),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              CustomText(
                AppStrings.expiryDate,
                textStyle: TextStyles.textLarge.copyWith(
                    fontSize: 12.sp,
                    color: const Color(ColorCode.semiBlack),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 8.w,
              ),
              CustomText(
                DateFormat('yyyy/MM/dd hh:mm a', AuthService.to.language)
                    .format(DateTime.parse(
                    DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
                        .parse(controller.certificateRespModel.value.data
                        ?.expiresAt ??
                        "")
                        .toString())),
                textStyle: TextStyles.textLarge.copyWith(
                    fontSize: 12.sp,
                    color: const Color(ColorCode.semiBlack),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    ) : const SpinKitCircle(color: Colors.yellow),onLoading: const SpinKitCircle(color: Colors.yellow));
  }
}
