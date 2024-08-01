import 'dart:convert';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/barcode/presentation/view/UsbPrinter.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/routes/app_pages.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/appbar_cell.dart';
import 'package:fusion_warehouses/widgets/custom_button.dart';
import 'package:fusion_warehouses/widgets/custom_button_container.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../resources/assets_svg_generated.dart';
import '../controllers/barcode_controller.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'dart:convert';

class BarcodeView extends GetView<BarcodeController> {
  BarcodeView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarItem(height:  60,
          leading: Transform(
            alignment: Alignment.center,
            transform: AuthService.to.language == 'ar'
                ? Matrix4.rotationY(0)
                : Matrix4.rotationY(math.pi),
            child: InkWell(
              child: AppSVGAssets.getWidget(AppSVGAssets.back),
              onTap: () {
                Get.back();
              },
            ),
          ),
          title: CustomText(AppStrings.externalPurchaseOrder,
              textStyle: TextStyles.textMedium.copyWith(
                  fontSize: 20.sp,
                  height: 1,
                  fontWeight: FontWeight.w500,
                  color: const Color(ColorCode.semiBlack))),
        ),
        body: SafeArea(
            child: controller.obx((state) => Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [

                  Container(
                    margin: EdgeInsets.all(4),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(
                                AuthService.to.language =='ar' ? controller.purchaseOrderModelUpdateStock?.data?.shop?.names?.ar??"" : controller.purchaseOrderModelUpdateStock?.data?.shop?.names?.en ??"",
                                  textStyle: TextStyles.textMedium.copyWith(
                                    fontSize: 18,
                                    color: Color(ColorCode.black),
                                    fontWeight: FontWeight.w700,
                                  )),
                              SizedBox(height: 4,),
                              Divider(
                                color: Color(ColorCode.black),
                              ),
                              SizedBox(height: 4,),
                              titleValue("${controller.purchaseOrderModelUpdateStock?.data?.product?.name ??""}",":Pro. Name"),

                              Divider(
                                color: Color(ColorCode.black),
                              ),
                              SizedBox(height: 4,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: titleValue("${DateFormat('EEEE, MMM d, yyyy',AuthService.to.language).format(DateTime.now())}",":Date"),
                                  ),
                                  SizedBox(width: 12,),
                                  Expanded(
                                    child: titleValue("${controller.purchaseOrderModelUpdateStock?.data?.product?.code ??""}",":Pro. No"),
                                  )
                                ],
                              ),
                              SizedBox(height: 12,),

                              Screenshot(
                                controller: controller.screenshotController,

                                child: OverRepaintBoundary(
                                  key: controller.globalKey,

                                  child: RepaintBoundary(
                                    child: BarcodeWidget(
                                      barcode: Barcode.code128(),
                                      data: controller.purchaseOrderModelUpdateStock!.data!.barCode!,
                                      drawText: true,
                                      width: double.infinity,
                                      height: 70,

                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  CustomButtonContainer(
                    CustomButton(
                      CustomText(AppStrings.print,
                          textStyle: TextStyles.textMedium.copyWith(
                              color: Color(ColorCode.semiBlack),
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp)),
                          () {
                        print("sfgwegewgewgher");
                        controller.capturePng().then((value){
                          Get.rootDelegate.toNamed(Routes.PDF_VIEW);
                        });
                          },
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
                      border:
                      Border.all(color: Color(ColorCode.semiBlack), width: 1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    CustomButton(
                      CustomText(AppStrings.cancel,
                          textStyle: TextStyles.textMedium.copyWith(
                              color: Color(ColorCode.semiBlack),
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp)),
                          () {
                        Get.back();
                          },
                      backGroundColor: const Color(ColorCode.white),
                    ),
                    width: Get.width,
                    height: 48.h,
                  ),
                ],
              ),
            ),onLoading: SpinKitCircle(color: Color(ColorCode.yellow),))));
  }

  titleValue(String title ,String value){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(title,
            textAlign: TextAlign.end,

            textStyle: TextStyles.textMedium.copyWith(
              fontSize: 14,
              color: Color(ColorCode.black),
              fontWeight: FontWeight.w500,
            )),
        SizedBox(width: 2,),
        Expanded(
          child: CustomText(value,
              maxLines: 1,
              textAlign: TextAlign.end,
              textStyle: TextStyles.textMedium.copyWith(
                fontSize: 14,
                overflow: TextOverflow.fade,
                color: Color(ColorCode.black),
                fontWeight: FontWeight.w700,
              )),
        ),


      ],
    );
  }
}
class OverRepaintBoundary extends StatefulWidget {
  final Widget? child;

  const OverRepaintBoundary({Key? key, this.child}) : super(key: key);

  @override
  OverRepaintBoundaryState createState() => OverRepaintBoundaryState();
}

class OverRepaintBoundaryState extends State<OverRepaintBoundary> {
  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }
}
