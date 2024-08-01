import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/shipping_details/models/purchase_order_details_model.dart';
import 'package:fusion_warehouses/pages/shipping_details/presentation/controllers/shipping_details_controller.dart';

import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/routes/app_pages.dart';
import 'package:fusion_warehouses/widgets/custom_button.dart';
import 'package:fusion_warehouses/widgets/custom_button_container.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:fusion_warehouses/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

class ReceiveView extends GetView<ShippingDetailsController> {
  ReceiveView({
    Key? key,
    required this.purchaseOrder
  }) : super(key: key);
  final PurchaseOrders purchaseOrder;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(AppStrings.quantityPurchasedFar,
                    textStyle: TextStyles.textMedium.copyWith(
                        color: Color(ColorCode.semiBlack),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp)),
                CustomText("${purchaseOrder.purchasedQuantity ??0}",
                    textStyle: TextStyles.textMedium.copyWith(
                        color: Color(ColorCode.semiBlack),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp)),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Divider(),
            SizedBox(
              height: 8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(AppStrings.quantityReceivedFar,
                    textStyle: TextStyles.textMedium.copyWith(
                        color: Color(ColorCode.semiBlack),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp)),
                CustomText('${purchaseOrder.stockQuantity ??0}',
                    textStyle: TextStyles.textMedium.copyWith(
                        color: Color(ColorCode.semiBlack),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp)),
              ],
            ),
            SizedBox(
              height: 28,
            ),
            CustomTextFormField(
              onSave: (text) {},
              controller: controller.newRecieveController,
              hint: AppStrings.newReceivedQuantity,
              inputType: TextInputType.number,
              label: AppStrings.newReceivedQuantity,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${purchaseOrder.product?.stock ??0}'
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        height: 30,
                        width: 1,
                        color: Color(ColorCode.yellow),
                      )
                    ]),
              ),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^([0-9]+(\-[0-9]+)?)'))

              ],
              validator: (value){
                return value == null ||
                    int.parse(controller.newRecieveController.text.isEmpty ? "0" :controller.newRecieveController.text) <purchaseOrder.product?.stock
                    ? null
                    : AppStrings.enterQuantity;
              },

            ),
            SizedBox(
              height: 32,
            ),
            CustomButtonContainer(
              CustomButton(
                CustomText(AppStrings.confirm,
                    textStyle: TextStyles.textMedium.copyWith(
                        color: Color(ColorCode.semiBlack),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp)),
                () {


                  if ((formKey.currentState?.validate() ??
                      false )&&controller.newRecieveController.text.isNotEmpty) {
                    FocusManager.instance.primaryFocus
                        ?.unfocus();
                    formKey.currentState?.save();
                    print("ddd ${controller.newRecieveController.text}");
                    controller.updateStock(purchaseOrder.id, controller.newRecieveController.text);
                    Get.back();
                  }else{
                    Get.snackbar("", AppStrings.enterQuantity);
                  }
                  // Get.rootDelegate.toNamed(Routes.BARCODE);
                },
                backGroundColor: const Color(ColorCode.yellow),
              ),
              width: Get.width,
              height: 48.h,
            ),
          ],
        ),
      ),
    );
  }
}
