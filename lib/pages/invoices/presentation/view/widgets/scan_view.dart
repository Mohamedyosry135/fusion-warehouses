import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/invoices/presentation/controllers/invoices_controller.dart';
import 'package:fusion_warehouses/pages/warehouse_delivery/presentation/view/warehouse_delivery_view.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_bottom_sheet.dart';
import 'package:fusion_warehouses/widgets/custom_button.dart';
import 'package:fusion_warehouses/widgets/custom_button_container.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';

import 'enter_manual_code_view.dart';

class ScanView extends GetView<InvoicesController> {
  ScanView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(AppStrings.scanTheProductBarcode,
              textStyle: TextStyles.textMedium.copyWith(
                fontSize: 12,
                height: 1,
                color: Color(ColorCode.gray),
                fontWeight: FontWeight.w400,
              )),
          SizedBox(
            height: 16,
          ),
          controller.isRefund
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CustomButtonContainer(
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
                          CustomText(AppStrings.returnsConfirmation,
                              textStyle: TextStyles.textMedium.copyWith(
                                  color: Color(ColorCode.semiBlack),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp)),
                        ],
                      ),
                      () async {
                        String? barcode = await controller.scanBarcode();
                        if (barcode != "-1" && barcode.isNotEmpty) {
                          controller.afterScan(barcode);
                        }

                        // customBottomSheet(
                        //     bottomSheetBody: Padding(
                        //         padding: const EdgeInsets.symmetric(
                        //             horizontal: 16, vertical: 32),
                        //         child: SucessCodeView(
                        //           buttomname: controller.warhouses==Warhouses.returns?AppStrings.returnsConfirmation:AppStrings.confirmExchange,
                        //           sucessname: controller.warhouses==Warhouses.warehouse?AppStrings.theProductIsNotIncludedInTheReturnRequest:AppStrings.theProductIsInTheReturnRequest,
                        //         )));
                      },
                      backGroundColor: const Color(ColorCode.yellow),
                    ),
                    width: Get.width,
                    height: 48.h,
                  ),
                )
              : Row(
                  children: [
                    Expanded(
                      child: CustomButtonContainer(
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
                              CustomText(AppStrings.barcodeScanning,
                                  textStyle: TextStyles.textMedium.copyWith(
                                      color: Color(ColorCode.semiBlack),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp)),
                            ],
                          ),
                          () async {
                            String? barcode = await controller.scanBarcode();
                            if (barcode != "-1" && barcode.isNotEmpty) {
                              controller.afterScan(barcode);
                            }
                          },
                          backGroundColor: const Color(ColorCode.yellow),
                        ),
                        width: Get.width,
                        height: 48.h,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: CustomButtonContainer(
                        CustomButton(
                          CustomText(AppStrings.typingTheBarcodeManually,
                              textStyle: TextStyles.textMedium.copyWith(
                                  color: Color(ColorCode.semiBlack),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp)),
                          () async {
                            String? barcode = await customBottomSheet(
                                bottomSheetBody: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 32),
                                    child: EnterManualCodeView()));

                            if (barcode != null && barcode.isNotEmpty) {
                              controller.afterScan(barcode);
                            }
                          },
                          backGroundColor: const Color(ColorCode.yellow),
                        ),
                        width: Get.width,
                        height: 48.h,
                      ),
                    ),
                  ],
                ),
          SizedBox(
            height: 16,
          ),
          Divider(),
        ],
      ),
    );
  }
}
