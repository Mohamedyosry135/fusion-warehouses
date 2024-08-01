import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/login/presentation/controllers/login_controller.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/custom_button.dart';
import 'package:fusion_warehouses/widgets/custom_button_container.dart';
import 'package:fusion_warehouses/widgets/custom_text_field_container.dart';
import 'package:fusion_warehouses/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_text.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();
  final loginFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(ColorCode.white),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Color(ColorCode.yellow), shape: BoxShape.circle),
            child: AppSVGAssets.getWidget(AppSVGAssets.lockIcon),
          ),
          SizedBox(
            height: 17.h,
          ),
          CustomText(
            AppStrings.login,
            textStyle: TextStyles.textXLarge.copyWith(
                fontSize: 31.sp,
                color: Color(ColorCode.semiBlack),
                fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: CustomTextFieldContainer(
                          CustomTextFormField(
                            onSave: (text) {
                              // controller.name = text!;
                              controller.phone = text!;
                            },
                            // validator: (value) {
                            //   return value!.length == 10 ? null : AppStrings.validPhone ;
                            // },
                            // maxlength: 10,
                            hint: AppStrings.phoneNumber,
                            inputType: TextInputType.phone,

                            prefixIcon: Stack(
                              children: [
                                CountryCodePicker(
                                  // padding: EdgeInsets.zero,
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  onChanged: (value) {
                                    controller.codeCountry.value =
                                        value.toString();
                                    print(controller.codeCountry);
                                    print(value.name);
                                    print(value.dialCode);
                                  },
                                  showFlag: false,
                                  initialSelection: '+966',
                                  favorite: const ['+966', '+20'],

                                  dialogSize:
                                      Size(Get.width * .8, Get.height * .5),
                                  alignLeft: false,
                                  barrierColor: Colors.transparent,
                                ),
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: Container(
                                    width: 1,
                                    height: 30,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                            label: AppStrings.phoneNumber,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      ObxValue<RxBool>(
                          (state) => Directionality(
                                textDirection: TextDirection.rtl,
                                child: CustomTextFieldContainer(
                                  CustomTextFormField(
                                      key: const ValueKey("password"),
                                      hint: AppStrings.password,
                                      label: "",
                                      obscuringCharacter: "•",
                                      onSave: (value) {
                                        controller.password = value!;
                                      },
                                      textInputAction: TextInputAction.done,
                                      nextFocus: (v) {},
                                      obscureText: true,
                                      isHiddenPassword: state.value,
                                      onTapShowHidePassword: () =>
                                          controller.changeIsHiddenPassword(),
                                      validator: (value) {
                                        return value == null ||
                                                isLength(value, 6, 30)
                                            ? null
                                            : AppStrings.enterCorrectPassword;
                                      },
                                      inputType: TextInputType.visiblePassword),
                                ),
                              ),
                          controller.isHiddenPassword),
                      SizedBox(
                        height: 42.h,
                      ),
                      controller.obx(
                          (state) => Align(
                                alignment: Alignment.center,
                                child: CustomButtonContainer(
                                  CustomButton(
                                    CustomText(AppStrings.login,
                                        textStyle: TextStyles.textMedium
                                            .copyWith(
                                                color:
                                                    Color(ColorCode.semiBlack),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.sp)),
                                    () {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      // Get.rootDelegate.toNamed(Routes.BOTTOM_NAVIGATION_SCREEN);
                                      if ((formKey.currentState?.validate() ??
                                          false)) {
                                        formKey.currentState?.save();
                                        controller.onLoginClicked();
                                      }
                                    },
                                    backGroundColor:
                                        const Color(ColorCode.yellow),
                                  ),
                                  width: Get.width,
                                  height: 48.h,
                                ),
                              ),
                          onLoading: const SpinKitCircle(color: Colors.yellow)),
                      // SizedBox(height: 16.h,),
                      // Align(
                      //   alignment: Alignment.center,
                      //   child: InkWell(
                      //     onTap: (){},
                      //     child: CustomText(
                      //       AppStrings.forgetPassword,
                      //       textStyle: TextStyles.textMedium.copyWith(
                      //           color: Color(ColorCode.semiBlack),
                      //           fontWeight: FontWeight.w500),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
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
                    await Get.updateLocale(Locale("en"));
                  } else if (AuthService.to.language == 'en') {
                    AuthService.to.selectLanguage('ar');
                    print('ar');

                    await Get.updateLocale(Locale("ar"));
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
              width: 246.w,
              height: 48.h,
            ),
          ),
          SizedBox(
            height: 17.h,
          ),
        ],
      ),
    );
  }
}
