import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/profile/models/profile_model.dart';
import 'package:fusion_warehouses/pages/profile/presentation/controllers/profile_controller.dart';
import 'package:fusion_warehouses/pages/profile/presentation/views/widgets/confirm_logout.dart';
import 'package:fusion_warehouses/pages/profile/presentation/views/widgets/information_shop_widget.dart';
import 'package:fusion_warehouses/pages/profile/presentation/views/widgets/photo_widget.dart';
import 'package:fusion_warehouses/pages/profile/presentation/views/widgets/regestration_tax_widget.dart';
import 'package:fusion_warehouses/pages/profile/presentation/views/widgets/shop_data_widget.dart';
import 'package:fusion_warehouses/pages/profile/presentation/views/widgets/show_zataca_certifi_widget.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/routes/app_pages.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/custom_button.dart';
import 'package:fusion_warehouses/widgets/custom_button_container.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(" controller.profileData.value.data!.imageUrl${ controller.profileData.value.data!.imageUrl}");
    print("scaffold");
    return Scaffold(
        backgroundColor: const Color(ColorCode.lightGray),
        body:GetBuilder<ProfileController>(builder: (cont){
          return Obx(() => cont.profileData.value == ProfileModel() ? SpinKitCircle(color: Color(ColorCode.yellow),):Column(
            children: [
              PhotoWidget(),
              // SizedBox(height: 8.h,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      cont.obx(
                              (state) => Column(
                            children: [
                              SizedBox(
                                height: 16.h,
                              ),

                              CustomText(
                                cont
                                    .profileData.value.data?.name ??
                                    "",
                                textStyle: TextStyles.textLarge.copyWith(
                                    fontSize: 20.sp,
                                    color: const Color(ColorCode.semiBlack),
                                    fontWeight: FontWeight.w500),
                              ),

                              // CreateCertificateWidget(),
                              SizedBox(
                                height: 16.h,
                              ),
                              ShopDataWidget(),
                              SizedBox(
                                height: 16.h,
                              ),
                              //
                              InformationShopWidget(
                                isArabic: AuthService.to.language == "ar",
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              // viechleData()
                            ],
                          ),
                          onLoading: const SpinKitCircle(color: Colors.yellow)),
                      // SizedBox(height: 16.h,),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       vertical: 8.0, horizontal: 16),
                      //   child: CustomButtonContainer(
                      //     CustomButton(
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         crossAxisAlignment: CrossAxisAlignment.end,
                      //         children: [
                      //           AppSVGAssets.getWidget(AppSVGAssets.edit),
                      //           SizedBox(
                      //             width: 8.w,
                      //           ),
                      //           CustomText(AppStrings.editProfile,
                      //               textStyle: TextStyles.textMedium.copyWith(
                      //                   color: Color(ColorCode.semiBlack),
                      //                   fontWeight: FontWeight.w600,
                      //                   fontSize: 12.sp)),
                      //         ],
                      //       ),
                      //           () async{
                      //              // Data? data = await
                      //              Get.rootDelegate
                      //             .toNamed(Routes.EDIT_PROFILE_VIEW, arguments: [
                      //           {"profileModel": controller.profileData.value}
                      //         ]);
                      //       //        if (data!= null) {
                      //       //          cont.profileData.value.data = data;
                      //       //        }
                      //       //
                      //       //       cont.update();
                      //       },
                      //       backGroundColor: const Color(ColorCode.white),
                      //     ),
                      //     width: Get.width,
                      //     height: 48.h,
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(46),
                      //         border: Border.all(
                      //             color: Color(ColorCode.semiBlack), width: 1)),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16),
                        child: CustomButtonContainer(
                          CustomButton(
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppSVGAssets.getWidget(AppSVGAssets.translate),
                                SizedBox(
                                  width: 8.w,
                                ),
                                CustomText(AppStrings.englishArabic,
                                    textStyle: TextStyles.textMedium.copyWith(
                                        color: Color(ColorCode.semiBlack),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp)),
                              ],
                            ),
                                () async {
                              if (AuthService.to.language == 'ar') {
                                AuthService.to.selectLanguage('en');
                                print('en');
                                await Get.updateLocale(const Locale("en"));
                              } else if (AuthService.to.language == 'en') {
                                AuthService.to.selectLanguage('ar');
                                print('ar');

                                await Get.updateLocale(const Locale("ar"));
                              }
                            },
                            backGroundColor: Colors.transparent,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(ColorCode.black),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(46)),
                          width: Get.width,

                          height: 48.h,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16),
                        child: CustomButtonContainer(
                          CustomButton(
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                // AppSVGAssets.getWidget(AppSVGAssets.signOut),
                                SizedBox(
                                  width: 8.w,
                                ),
                                CustomText(AppStrings.signOut,
                                    textStyle: TextStyles.textMedium.copyWith(
                                        color: Color(ColorCode.white),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp)),
                              ],
                            ),
                                () {
                              Get.bottomSheet(
                                ConfirmLogout(),
                                shape: const RoundedRectangleBorder(
                                  // <-- SEE HERE
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                backgroundColor: Color(ColorCode.white),
                              );
                            },
                            backGroundColor: const Color(ColorCode.red),
                          ),
                          width: Get.width,
                          height: 48.h,
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       vertical: 8.0, horizontal: 16),
                      //   child: CustomButtonContainer(
                      //     CustomButton(
                      //       // Row(
                      //       //   crossAxisAlignment: CrossAxisAlignment.center,
                      //       //   mainAxisAlignment: MainAxisAlignment.center,
                      //       //   children: [
                      //       //     AppSVGAssets.getWidget(AppSVGAssets.translate),
                      //       //     SizedBox(
                      //       //       width: 8.w,
                      //       //     ),
                      //       //     CustomText(AppStrings.seeStorePage,
                      //       //         textStyle: TextStyles.textMedium.copyWith(
                      //       //             color: Color(ColorCode.semiBlack),
                      //       //             fontWeight: FontWeight.w600,
                      //       //             fontSize: 12.sp)),
                      //       //   ],
                      //       // ),
                      //       CustomText(AppStrings.seeStorePage,
                      //           textStyle: TextStyles.textMedium.copyWith(
                      //               color: Color(ColorCode.semiBlack),
                      //               fontWeight: FontWeight.w600,
                      //               fontSize: 12.sp)),
                      //           () async {
                      //         // if (AuthService.to.language == 'ar') {
                      //         //   AuthService.to.selectLanguage('en');
                      //         //   print('en');
                      //         //   await Get.updateLocale(Locale("en"));
                      //         // } else if (AuthService.to.language == 'en') {
                      //         //   AuthService.to.selectLanguage('ar');
                      //         //   print('ar');
                      //         //
                      //         //   await Get.updateLocale(Locale("ar"));
                      //         // }
                      //       },
                      //       backGroundColor: Colors.transparent,
                      //     ),
                      //     decoration: BoxDecoration(
                      //         border: Border.all(
                      //           color: Color(ColorCode.black),
                      //           width: 1,
                      //         ),
                      //         borderRadius: BorderRadius.circular(46)),
                      //     width: Get.width,
                      //
                      //     height: 48.h,
                      //   ),
                      // ),



                      SizedBox(height: 50.h,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),

            ],
          ));
        },));
  }
}
