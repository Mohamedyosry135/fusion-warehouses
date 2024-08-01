import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/shipping_details/models/buy_stock_model_request.dart';
import 'package:fusion_warehouses/pages/shipping_details/presentation/controllers/shipping_details_controller.dart';
import 'package:fusion_warehouses/pages/shipping_details/presentation/view/widgets/supplier_filter.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/custom_button.dart';
import 'package:fusion_warehouses/widgets/custom_button_container.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:fusion_warehouses/widgets/custom_text_field_container.dart';
import 'package:fusion_warehouses/widgets/custom_text_form_field.dart';
import 'package:fusion_warehouses/widgets/date_picker_fn.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:fusion_warehouses/pages/shipping_details/models/update_state_purchase_order_request.dart';

import 'package:fusion_warehouses/pages/shipping_details/models/purchase_order_details_model.dart';

class ButStockBottomsheet extends GetView<ShippingDetailsController> {
  final PurchaseOrders purchaseOrder;
  ButStockBottomsheet({required this.purchaseOrder});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(purchaseOrder.purchasedPrice!=null){
      controller.actualPurchasePriceController.text = purchaseOrder.purchasedPrice.toString();
    }

    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CustomText(
                AppStrings.checkout,
                textStyle: TextStyles.textMedium.copyWith(
                    color: const Color(ColorCode.semiBlack),
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp)),
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(),
          const SizedBox(
            height: 8,
          ),

          CustomTextFieldContainer(
            CustomTextFormField(
              onSave: (text) {},
              hint: AppStrings.dateOfShipment,
              inputType: TextInputType.text,
              label: AppStrings.dateOfShipment,
              enable: true,
              controller: controller.shippmentDateController,
              suffixIcon: AppSVGAssets.getWidget(AppSVGAssets.date),
              onTap: () async {
                controller.shippmentDateTime = await showDatePickerFN(
                    context, controller.shippmentDateTime);
                if (controller.shippmentDateTime != null) {
                  controller.shippmentDateRequest =
                      ((controller.shippmentDateTime.millisecondsSinceEpoch /
                          1000) + controller.shippmentDateTime!.timeZoneOffset
                          .inSeconds).toString();

                  controller.shippmentDateController.text =
                      DateFormat('EEEE, MMM d, yyyy', AuthService.to.language)
                          .format(controller.shippmentDateTime!);
                }
              },
            ),
          ),


          CustomTextFormField(
            onSave: (text) {},
            controller: controller.actualPurchasePriceController,
            hint: AppStrings.actualPurchasePrice,
            inputType: TextInputType.number,
            label: AppStrings.actualPurchasePrice,


          ),

         Padding(
           padding: EdgeInsets.symmetric(horizontal: 22),

           child:  Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               CustomText(AppStrings.quantityPurchasedSoFar,
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
         ),
          CustomTextFormField(
            onSave: (text) {},
            controller: controller.newPurchasedQuantityController,
            hint: AppStrings.newPurchasedQuantity,
            inputType: TextInputType.number,
            label: AppStrings.newPurchasedQuantity,
          ),



          SuppliersListFilter(),


          // controller.dateTime =
          //     await showDatePickerFN(context, controller.dateTime);
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 48.h,
                  width: double.infinity,
                  child: CustomButton(
                    CustomText(AppStrings.confirm,
                        textStyle: TextStyles.textMedium.copyWith(
                            color: const Color(ColorCode.semiBlack),
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp)),
                        () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if(controller.newPurchasedQuantityController.text.isNotEmpty && controller.actualPurchasePriceController.text.isNotEmpty && controller.shippmentDateController.text.isNotEmpty && controller.selectedSupplier != null){
                        PurchaseOrderRequest purchasesOrderRequest = PurchaseOrderRequest(
                          newPurchasedQuantity: int.parse( controller.newPurchasedQuantityController.text ),
                          productSupplierId: controller.selectedSupplier?.id ,
                          purchasedPrice: double.parse( controller.actualPurchasePriceController.text ),
                            shipmentDate: controller.shippmentDateRequest

                        );
                        controller.buyStockModel.purchaseOrder = purchasesOrderRequest;
                        print(controller.buyStockModel.toJson());
                        controller.buyStock(purchaseOrder.id);
                          Get.back();
                      }else{
                        Get.snackbar("", AppStrings.allFieldsRequired);

                      }

                    },
                    backGroundColor: const Color(ColorCode.yellow),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: SizedBox(
                  height: 48.h,
                  child: CustomButton(
                    CustomText(AppStrings.cancel,
                        textStyle: TextStyles.textMedium.copyWith(
                            color: const Color(ColorCode.white),
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp)),
                        () {
                      FocusManager.instance.primaryFocus?.unfocus();

                      Get.back();
                    },
                    backGroundColor: const Color(ColorCode.red),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
