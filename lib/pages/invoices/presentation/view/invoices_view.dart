import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/invoices/presentation/view/Data_view.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/appbar_cell.dart';
import 'package:fusion_warehouses/widgets/custom_button.dart';
import 'package:fusion_warehouses/widgets/custom_button_container.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:fusion_warehouses/widgets/return_key.dart';
import 'package:get/get.dart';

import '../../../../resources/assets_svg_generated.dart';
import '../controllers/invoices_controller.dart';
import 'widgets/products_cell.dart';
import 'widgets/scan_view.dart';

enum InvoiceType { current, Done }

class InvoicesView extends GetView<InvoicesController> {
  InvoicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarItem(
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
          title: CustomText(
              !controller.isRefund
                  ? AppStrings.deliveryOrder
                  : AppStrings.returnRequest,
              textStyle: TextStyles.textMedium.copyWith(
                  fontSize: 20.sp,
                  height: 1,
                  fontWeight: FontWeight.w500,
                  color: const Color(ColorCode.semiBlack))),
        ),
        body: controller.obx(
            (state) => SingleChildScrollView(
                  child: SafeArea(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            AppSVGAssets.getWidget(
                              AppSVGAssets.gpersonal,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            CustomText(
                                controller.ordersDetails?.data?.invoice
                                        ?.customer?.customerName ??
                                    "",
                                textStyle: TextStyles.textMedium.copyWith(
                                  fontSize: 14,
                                  color: Color(ColorCode.semiBlack),
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        color: Color(ColorCode.secondryblueGray),
                        child: RichText(
                          maxLines: 2,
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: AppStrings.dialNumber,
                                style: TextStyles.textMedium.copyWith(
                                    color: Color(ColorCode.semiBlack),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: controller.ordersDetails?.data?.number ??
                                    "",
                                style: TextStyles.textMedium.copyWith(
                                    color: Color(ColorCode.semiBlack),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            AppSVGAssets.getWidget(
                              AppSVGAssets.gtimer,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            CustomText(
                                returnOrderStatus(
                                    controller.ordersDetails?.data?.status ??
                                        ""),
                                textStyle: TextStyles.textMedium.copyWith(
                                  fontSize: 14,
                                  color: Color(ColorCode.gray),
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        color: Color(ColorCode.secondryblueGray),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(AppStrings.products,
                                textStyle: TextStyles.textMedium.copyWith(
                                  fontSize: 16,
                                  color: Color(ColorCode.semiBlack),
                                  fontWeight: FontWeight.w500,
                                )),
                            CustomText(
                                "${controller.ordersDetails?.data?.warehouseOrderItems?.length ?? 0}",
                                textStyle: TextStyles.textMedium.copyWith(
                                  fontSize: 16,
                                  color: Color(ColorCode.semiBlack),
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            print("lojk ${controller.ordersDetails!.data!.warehouseOrderItems![index].code}");
                            return Obx(() => ProductView(
                                warehouseOrderItem: controller.ordersDetails!
                                    .data!.warehouseOrderItems![index],
                                row: controller
                                        .ordersDetails!
                                        .data!
                                        .warehouseOrderItems![index]
                                        .isChecked
                                        .value
                                    ? AppSVGAssets.getWidget(
                                        AppSVGAssets.okay,
                                      )
                                    : Container(),
                                ontab: () {}));
                          },
                          itemCount: controller.ordersDetails?.data
                                  ?.warehouseOrderItems?.length ??
                              0),
                      GetBuilder<InvoicesController>(builder: (cont) {
                        return cont.ordersDetails?.data?.status == "pending" &&
                                cont.isExistOrNot().value
                            ? ScanView()
                            : SizedBox();
                      }),
                      // DataView(),
                      Obx(() => !controller.isExistOrNot().value
                          ? CustomButtonContainer(
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: CustomButton(
                                  CustomText(
                                      controller.ordersDetails?.data?.status ==
                                              'refund'
                                          ? AppStrings.confirmReturn
                                          : AppStrings.confirmExchange,
                                      textStyle: TextStyles.textMedium.copyWith(
                                          color: Color(ColorCode.semiBlack),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp)),
                                  () {
                                    controller.editStateOfOrder(controller.id!);
                                  },
                                  backGroundColor:
                                      const Color(ColorCode.yellow),
                                ),
                              ),
                              width: Get.width,
                              height: 48.h,
                            )
                          : SizedBox())
                    ],
                  )),
                ),
            onLoading: SpinKitCircle(color: Color(ColorCode.yellow))));
  }
}
