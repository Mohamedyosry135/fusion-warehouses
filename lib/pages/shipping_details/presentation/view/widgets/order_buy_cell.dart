import 'package:flutter/material.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/shipping_details/models/purchase_order_details_model.dart';
import 'package:fusion_warehouses/pages/shipping_details/presentation/controllers/shipping_details_controller.dart';
import 'package:fusion_warehouses/pages/shipping_details/presentation/view/widgets/buy_stock_bottomsheet.dart';
import 'package:fusion_warehouses/pages/shipping_details/presentation/view/widgets/receive_view.dart';
import 'package:fusion_warehouses/pages/shipping_details/presentation/view/widgets/return_amount_bottomsheet.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/custom_bottom_sheet.dart';
import 'package:fusion_warehouses/widgets/custom_button.dart';
import 'package:fusion_warehouses/widgets/custom_button_container.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderBuyItem extends GetView<ShippingDetailsController> {
  OrderBuyItem({Key? key, required this.purchaseOrder}) : super(key: key);

  final PurchaseOrders purchaseOrder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        titleValueRow(
            AppStrings.internalOrderNumber, purchaseOrder.number ?? ""),
        titleValueRow(
            AppStrings.productNumber, purchaseOrder.product?.partNumber ?? ""),
        titleValueRow(
            AppStrings.productName, purchaseOrder.product?.name ?? ""),
        titleValueRow(
            AppStrings.inventory, "${purchaseOrder.product?.stock ?? ""}"),
        titleValueRow(AppStrings.applicant, purchaseOrder.user?.name ?? ""),
        titleValueRow(
          AppStrings.releaseDate,
          DateFormat('EEEE, MMM d, yyyy, h:mm a', AuthService.to.language)
              .format(DateTime.parse(
            purchaseOrder.createdAt ?? "",
          )),
        ),
        titleValueRow(
            AppStrings.branch,
            AuthService.to.language == 'ar'
                ? purchaseOrder.shopBranch?.names?.ar ?? ""
                : purchaseOrder.shopBranch?.names?.en ?? ""),
        titleValueRow(
            AppStrings.requiredQuantity, "${purchaseOrder.askQuantity ?? ""}"),
        titleValueRow(AppStrings.purchasedQuantity,
            "${purchaseOrder.purchasedQuantity ?? ""}"),
        titleValueRow(AppStrings.quantityReceived,
            "${purchaseOrder.stockQuantity ?? ""}"),
        titleValueRow(AppStrings.returnedQuantity,
            "${purchaseOrder.refundQuantity ?? ""}"),
        SizedBox(height: 16,),
        if(controller.purchaseOrderDetails?.data?.state != "completed" || controller.purchaseOrderDetails?.data?.state != "cancelled" ||
            controller.purchaseOrderDetails?.data?.state != "rejected")
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (controller.permissionUser(['admin', 'purchasing_management']))
              Center(
              child: CustomButtonContainer(
                CustomButton(
                  CustomText(AppStrings.checkout,
                      textStyle: TextStyles.textMedium.copyWith(
                          color: const Color(ColorCode.semiBlack),
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp)),
                      () {
                    customBottomSheet(
                        bottomSheetBody: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 32),
                            child: ButStockBottomsheet(purchaseOrder: purchaseOrder,)));
                  },
                  backGroundColor: const Color(ColorCode.yellow),
                ),
                height: 48,
                width: 120,
              ),
            ),
            if (controller.permissionUser(['admin', 'purchase_order_complete']))
              Center(
                child: CustomButtonContainer(
                  CustomButton(
                    CustomText(AppStrings.receipt,
                        textStyle: TextStyles.textMedium.copyWith(
                            color: const Color(ColorCode.semiBlack),
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp)),
                        () {
                      customBottomSheet(
                          bottomSheetBody: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 32),
                              child: ReceiveView(purchaseOrder: purchaseOrder,)));
                    },
                    backGroundColor: const Color(ColorCode.yellow),
                  ),
                  height: 48,
                  width: 120,
                ),
              ),
            if (controller.permissionUser(['admin', 'purchase_order_refund']))
              Center(
              child: CustomButtonContainer(
                CustomButton(
                  CustomText(AppStrings.refund,
                      textStyle: TextStyles.textMedium.copyWith(
                          color: const Color(ColorCode.semiBlack),
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp)),
                      () {
                    customBottomSheet(
                        bottomSheetBody: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 32),
                            child: ReturnAmountBottomsheet(purchaseOrder: purchaseOrder,)));
                  },
                  backGroundColor: const Color(ColorCode.yellow),
                ),
                height: 48,
                width: 120,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget titleValueRow(String title, String value) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(title,
                    textStyle: TextStyles.textMedium.copyWith(
                      fontSize: 12,
                      color: Color(ColorCode.semiBlack),
                      fontWeight: FontWeight.w400,
                    )),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: CustomText(value,
                      textAlign: TextAlign.end,
                      textStyle: TextStyles.textMedium.copyWith(
                        fontSize: 12,
                        color: Color(ColorCode.gray),
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ],
            ),
            Divider(),
          ],
        ));
  }
}
