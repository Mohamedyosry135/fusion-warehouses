import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/profile/presentation/controllers/profile_controller.dart';
import 'package:fusion_warehouses/resources/assets_generated.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';

class InformationShopWidget extends GetView<ProfileController> {
  const InformationShopWidget({Key? key, required this.isArabic})
      : super(key: key);
  final bool isArabic;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Color(ColorCode.white),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Directionality(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(1),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const BoxDecoration(
                    color: Color(ColorCode.yellow),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Color(ColorCode.yellow),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),

                      child: Image.network(
                        controller.profileData.value.data?.shop?.imageUrl ?? "",
                        fit: BoxFit.fill,
                        loadingBuilder: (context, child, loadingProgress) =>
                        (loadingProgress == null)
                            ? child
                            : const CircularProgressIndicator(),
                        errorBuilder: (context, error, stackTrace) => Image(
                          image: AppAssets.logoInCircle,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                CustomText(
                  isArabic
                      ? controller.profileData.value.data?.shop?.shopNames
                      ?.firstWhere((element) => element.locale == 'ar')
                      .name ??
                      ""
                      : controller.profileData.value.data?.shop?.shopNames
                      ?.firstWhere((element) => element.locale == 'en')
                      .name ??
                      "",
                  textStyle: TextStyles.textLarge.copyWith(
                      fontSize: 12.sp,
                      color: const Color(ColorCode.semiBlack),
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),

            SizedBox(
              height: 12.h,
            ),

            titleValue(
              AppStrings.taxRegistrationNumber,
              controller.profileData.value.data?.shop?.taxNumber ??"",
            ),
            SizedBox(
              height: 12.h,
            ),
            titleValue(
              isArabic ? "الوصف" : "Description",
              isArabic
                  ? controller.profileData.value.data?.shop?.shopNames
                          ?.firstWhere((element) => element.locale == 'ar')
                          .description ??
                      ""
                  : controller.profileData.value.data?.shop?.shopNames
                          ?.firstWhere((element) => element.locale == 'en')
                          .description ??
                      "",
            ),
            SizedBox(
              height: 12.h,
            ),
            titleValue(
              isArabic ? "نوع النشاط" : "Industry",
              isArabic
                  ? controller.profileData.value.data?.shop?.shopNames
                          ?.firstWhere((element) => element.locale == 'ar')
                          .businessCategory ??
                      ""
                  : controller.profileData.value.data?.shop?.shopNames
                          ?.firstWhere((element) => element.locale == 'en')
                          .businessCategory ??
                      "",
            ),
            SizedBox(
              height: 12.h,
            ),

            titleValue(
              AppStrings.phoneNumber,
              controller.profileData.value.data?.shop?.phone ??"",
            ),
            SizedBox(
              height: 12.h,
            ),

            titleValue(
              AppStrings.email,
              controller.profileData.value.data?.shop?.email ??"",
            ),
            SizedBox(
              height: 12.h,
            ),

            titleValue(
              AppStrings.address,
              controller.profileData.value.data?.shop?.address?.addressLine1 ??"",
            ),

          ],
        ),
      ),
    );
  }

  titleValue(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title,
          textStyle: TextStyles.textLarge.copyWith(
              fontSize: 10.sp,
              color: const Color(ColorCode.semiBlack),
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: CustomText(
            value,
            maxLines: 2,
            textAlign: TextAlign.end,
            textStyle: TextStyles.textLarge.copyWith(
                fontSize: 10.sp,

                color: const Color(ColorCode.gray),
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
