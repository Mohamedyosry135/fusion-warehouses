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

class ReturnAmountBottomsheet extends GetView<ShippingDetailsController> {
  ReturnAmountBottomsheet({
    Key? key,
    required this.purchaseOrder
  }) : super(key: key);
  final PurchaseOrders purchaseOrder;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomText(AppStrings.returnQuantity,
              textStyle: TextStyles.textMedium.copyWith(
                  color: Color(ColorCode.semiBlack),
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp)),

          SizedBox(
            height: 28,
          ),
          CustomTextFormField(
            onSave: (text) {},
            controller: controller.returmAmountController,
            hint: AppStrings.returnedQuantity,
            inputType: TextInputType.number,
            label: AppStrings.returnedQuantity,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^([0-9]+(\-[0-9]+)?)'))

            ],
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


                if (controller.returmAmountController.text.isNotEmpty) {
                  FocusManager.instance.primaryFocus
                      ?.unfocus();
                  print("ddd ${controller.returmAmountController.text}");
                  controller.returnStock(purchaseOrder.id, controller.returmAmountController.text);
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
    );
  }
}
